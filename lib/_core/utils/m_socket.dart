import 'dart:convert';

import 'package:ballkkaye_frontend/data/gvm/session_gvm.dart';
import 'package:ballkkaye_frontend/data/model/chat_room.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/chat_room_detail_vm.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

import 'm_device.dart';

class MSocket {
  Map<int, StompClient> _clients = {};
  final mContext = navigatorKey.currentContext!;
  final dynamic ref;

  MSocket(this.ref);

  int? get myId => ref.read(sessionProvider).user.id;
  String? get myNickname => ref.read(sessionProvider).user.nickname;

  /// 웹소켓 연결
  void connectWebSocket(int chatRoomId) async {
    Logger().d("🧩 connectWebSocket 호출됨 with chatRoomId = $chatRoomId");

    String? token = await getAccessToken();
    Logger().d("🧩 accessToken: $token");

    if (token == null) {
      Logger().e("accessToken 없음: WebSocket 연결 불가");
      return;
    }
    if (_clients.containsKey(chatRoomId)) return; // 이미 해당 채팅방의 웹소켓 연결된 상태

    StompClient stompClient = StompClient(
      config: StompConfig(
        url: 'ws://10.0.2.2:8080/connect?token=$token&roomId=$chatRoomId',
        onConnect: (StompFrame frame) {
          // 이 시점 = "CONNECTED" 프레임 도착 후
          Logger().d("$chatRoomId번 채팅방 웹소켓 연결 성공: ${frame.command}"); // 항상 "CONNECTED"
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
        ref.read(chatRoomDetailProvider(chatRoomId).notifier).addMessage(chatRoom);
      },
    );
  }

  /// 지정된 채팅방의 WebSocket 연결이 활성화되어 있는지 확인,
  /// 연결이 되어 있지 않다면 connectWebSocket(chatRoomId)를 호출하여 연결을 시도
  /// 최대 3초(30 * 100ms) 동안 연결이 완료되기를 기다리며, 그 이후에도 연결되지 않으면 예외를 throw
  ///
  /// 사용 시점: 메시지 전송 전에 반드시 호출하여 연결 상태를 보장
  Future<void> ensureConnected(int chatRoomId) async {
    if (!_clients.containsKey(chatRoomId) || !_clients[chatRoomId]!.connected) {
      connectWebSocket(chatRoomId);

      int retry = 0;
      while (
          (!_clients.containsKey(chatRoomId) || !_clients[chatRoomId]!.connected) && retry < 30) {
        await Future.delayed(Duration(milliseconds: 100));
        retry++;
      }

      if (!_clients.containsKey(chatRoomId) || !_clients[chatRoomId]!.connected) {
        throw Exception("WebSocket 연결 실패 (3초 내 연결 안 됨)");
      }
    }
  }

  /// 메세지 전송
  Future<ChatRoom> sendMessage(int chatRoomId, String message) async {
    Logger().w("전송 시점에 WebSocket이 아직 연결 안됨");
    await ensureConnected(chatRoomId);
    Logger().w("전송 시점에 WebSocket이 이제 연결 됨");

    final session = ref.read(sessionProvider);
    Logger().w("🪪 sessionProvider 상태 확인: $session");
    Logger().w("🧑 user.id = ${session.user?.id}, user.nickname = ${session.user?.nickname}");

    if (session.user.id == null || myNickname == null) {
      Logger().e(
          "🚨 사용자 정보 없음: session.user.id=${session.user.id}, session.user.nickname=${session.user.nickname}");
      throw Exception("로그인 정보 없음: 채팅 불가능");
    }
    Logger().d("📤 sendMessage 호출됨: chatRoomId=$chatRoomId, message=$message");
    StompClient? client = _clients[chatRoomId];
    Logger().d("✅ 현재 클라이언트 존재 여부: ${client != null}");
    Logger().d("✅ 현재 클라이언트 연결 여부: ${client?.connected}");
    if (client == null || !client.connected) {
      Logger().e("🚫 WebSocket 클라이언트가 null이거나 연결되지 않음");
      throw Exception("WebSocket 연결 안됨");
    }

    String? token = await getAccessToken();
    if (token == null) {
      Logger().e("🚫 accessToken 없음");
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

    Logger().i("📦 보낼 ChatRoom 데이터: $myChat");

    client?.send(
      destination: '/pub/chat/send',
      body: jsonEncode({
        "accessToken": token,
        "chatRoomId": chatRoomId,
        "message": message,
        "messageType": "TALK",
      }),
    );

    try {
      final chatRoom = ChatRoom.fromMap(myChat);
      Logger().i("✅ ChatRoom.fromMap 성공: $chatRoom");
      return chatRoom;
    } catch (e, stack) {
      Logger().e("❌ ChatRoom.fromMap 실패: ${e.toString()}", stackTrace: stack);
      rethrow;
    }
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
