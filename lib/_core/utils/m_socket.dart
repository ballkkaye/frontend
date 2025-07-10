import 'dart:convert';

import 'package:ballkkaye_frontend/data/gvm/session_gvm.dart';
import 'package:ballkkaye_frontend/data/model/chat_room.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/chat_room_detail_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

import 'm_device.dart';

class MSocket {
  Map<int, StompClient> _clients = {};
  final mContext = navigatorKey.currentContext!;
  final Ref ref;

  MSocket(this.ref);

  int? get myId => ref.read(sessionProvider).user?.id;
  String? get myNickname => ref.read(sessionProvider).user?.nickname;

  /// 웹소켓 연결
  void connectWebSocket(int chatRoomId) async {
    String? token = await getAccessToken();

    if (token == null) {
      Logger().e("accessToken 없음: WebSocket 연결 불가");
      return;
    }
    if (_clients.containsKey(chatRoomId)) return; // 이미 해당 채팅방의 웹소켓 연결된 상태

    StompClient stompClient = StompClient(
      config: StompConfig(
        url: 'ws://localhost:8080/connect?token=$token&roomId=$chatRoomId',
        onConnect: (StompFrame frame) {
          // 이 시점 = "CONNECTED" 프레임 도착 후
          Logger().d(
              "$chatRoomId번 채팅방 웹소켓 연결 성공: ${frame.command}"); // 항상 "CONNECTED"
          _authenticate(token, chatRoomId); // 중복 구독 방지 인증
          _subscribe(chatRoomId); // 구독
        },
        onWebSocketError: (error) {
          Logger().e("[$chatRoomId] WebSocket 에러: $error");
          ScaffoldMessenger.of(mContext).showSnackBar(
            SnackBar(content: Text("채팅방 연결에 실패했어요. 잠시 후 다시 시도해 주세요.")),
          );
        },
        onDisconnect: (_) {
          Logger().w("$chatRoomId번 채팅방 연결 종료됨");
        },
        onStompError: (frame) {
          Logger().e("STOMP 오류: ${frame.body}");
          ScaffoldMessenger.of(mContext).showSnackBar(
            SnackBar(content: Text("채팅방 접속 중 문제가 발생했어요. 잠시 후 다시 시도해 주세요.")),
          );
        },
        heartbeatOutgoing: Duration(seconds: 5),
        heartbeatIncoming: Duration(seconds: 5),
      ),
    );

    stompClient.activate();
    _clients[chatRoomId] = stompClient;
  }

  /// 중복 구독 방지 인증
  void _authenticate(String token, int chatRoomId) {
    StompClient? client = _clients[chatRoomId];
    if (client == null) return;

    client.send(
      destination: "/pub/chat/auth",
      body: jsonEncode({
        "token": token,
        "roomId": chatRoomId,
      }),
    );
  }

  /// 구독
  void _subscribe(int chatRoomId) {
    StompClient? client = _clients[chatRoomId];
    if (client == null) return;

    client.subscribe(
      destination: "/sub/chat/$chatRoomId",
      callback: (frame) {
        Logger().d("$chatRoomId번 채팅방 구독: ${frame.body}");
        final chatRoom = ChatRoom.fromMap(jsonDecode(frame.body!));
        ref
            .read(chatRoomDetailProvider(chatRoomId).notifier)
            .addMessage(chatRoom);
      },
    );
  }

  /// 메세지 전송
  Future<ChatRoom> sendMessage(int chatRoomId, String message) async {
    StompClient? client = _clients[chatRoomId];
    if (client == null) {
      throw Exception("WebSocket 연결 안됨");
    }

    String? token = await getAccessToken();
    if (token == null) {
      throw Exception("accessToken 없음: 채팅 전송 불가능");
    }

    // 전송 시간 기록 (생성용)
    final now = DateTime.now();

    final myChat = {
      "messageId": 0,
      "senderId": myId,
      "senderName": myNickname,
      "message": message,
      "messageType": "TALK",
      "isOwner": true,
      "createdAt": now.toIso8601String(),
      "chatRoomId": chatRoomId,
    };

    client.send(
      destination: '/pub/chat/send',
      body: jsonEncode({
        "accessToken": token,
        "chatRoomId": chatRoomId,
        "message": message,
        "messageType": "TALK",
      }),
    );

    return ChatRoom.fromMap(myChat);
  }

  /// StompClient 인스턴스의 WebSocket 연결 종료
  void disconnect(int chatRoomId) {
    StompClient? client = _clients[chatRoomId];
    if (client == null) return;

    client.deactivate(); // 연결 끊기
    _clients.remove(chatRoomId); // 맵에서 제거
    Logger().d("채팅방 $chatRoomId 연결 해제됨");
  }
}
