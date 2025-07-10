import 'package:ballkkaye_frontend/_core/utils/m_socket.dart';
import 'package:ballkkaye_frontend/data/gvm/session_gvm.dart';
import 'package:ballkkaye_frontend/data/model/chat_room.dart';
import 'package:ballkkaye_frontend/data/repository/chat_room_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final chatRoomDetailProvider = AutoDisposeNotifierProvider.family<
    ChatRoomDetailVM, ChatRoomDetailModel?, int>(() {
  return ChatRoomDetailVM();
});

class ChatRoomDetailVM
    extends AutoDisposeFamilyNotifier<ChatRoomDetailModel?, int> {
  final mContext = navigatorKey.currentContext!;

  @override
  ChatRoomDetailModel? build(int chatRoomId) {
    init(chatRoomId);

    ref.onDispose(() {
      Logger().d("ChatRoomDetailVM 파괴됨");
    });

    return null;
  }

  Future<void> init(int chatRoomId) async {
    Map<String, dynamic> data = await ChatRoomRepository().getOne(chatRoomId);
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("채팅방 상세보기 실패 : ${data["msg"]}")),
      );
      return;
    }

    state = ChatRoomDetailModel.fromMap(data["body"]);
  }

  /// 메시지 중복 여부 체크
  bool _isDuplicate(ChatRoom newMsg) {
    return state?.groupedChatList.any((item) {
          if (item is ChatRoom) {
            return item.chat.message == newMsg.chat.message &&
                item.chat.user.id == newMsg.chat.user.id &&
                item.chat.createdAt == newMsg.chat.createdAt;
          }
          return false;
        }) ??
        false;
  }

  /// 수신된 채팅 메시지 현재 채팅 목록 상태에 추가
  void addMessage(ChatRoom newMsg) {
    if (_isDuplicate(newMsg)) {
      Logger().d("중복 메시지 감지됨. 추가하지 않음.");
      return;
    }

    final newDate = newMsg.chat.createdAt.toLocal();
    final newDateString =
        "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

    final lastDate = state?.groupedChatList.reversed
        .firstWhere((e) => e is ChatRoom, orElse: () => null)
        ?.chat
        .createdAt
        ?.toLocal();
    final lastDateString = lastDate != null
        ? "${lastDate.year}-${lastDate.month.toString().padLeft(2, '0')}-${lastDate.day.toString().padLeft(2, '0')}"
        : "";

    List<dynamic> newList = [...state!.groupedChatList];

    if (newDateString == lastDateString) {
      newList.add(newMsg);
    } else {
      newList.add(newDateString);
      newList.add(newMsg);
    }

    state = state!.copyWith(groupedChatList: newList);
  }

  // 채팅
  Future<void> chat(int chatRoomId, String message) async {
    try {
      ChatRoom newChatRoom =
          await MSocket(ref).sendMessage(chatRoomId, message);

      addMessage(newChatRoom);
    } catch (e) {
      // 실패 알림
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("채팅 전송 실패: ${e.toString()}")),
      );
    }
  }

  // 채팅방 퇴장
  Future<void> exit(int chatRoomId) async {
    // userId 가져오기
    SessionModel model = ref.read(sessionProvider);
    final userId = model.user?.id;
    if (userId == null) {
      Logger().e("사용자 정보 없음: 퇴장 불가");
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("로그인 정보가 없어 채팅방을 나갈 수 없습니다.")),
      );
      return;
    }

    // 퇴장
    Map<String, dynamic> data = await ChatRoomRepository().exit(userId);
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("채팅방 퇴장 실패 : ${data["msg"]}")),
      );
      return;
    }

    // 웹소켓 연결 해제
    try {
      MSocket(ref).disconnect(chatRoomId);
    } catch (e) {
      Logger().e("WebSocket 연결 해제 실패: $e");

      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("채팅방 연결 해제 중 문제가 발생했어요. 잠시 후 다시 시도해 주세요.")),
      );
    }

    Navigator.pop(mContext);
  }

  // 채팅방 삭제
  Future<void> deleteOne(int chatRoomId) async {
    Map<String, dynamic> data =
        await ChatRoomRepository().deleteOne(chatRoomId);
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("채팅방 삭제 실패 : ${data["msg"]}")),
      );
      return;
    }
    try {
      MSocket(ref).disconnect(chatRoomId);
    } catch (e) {
      Logger().e("WebSocket 연결 해제 실패: $e");

      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("채팅방 연결 해제 중 문제가 발생했어요. 잠시 후 다시 시도해 주세요.")),
      );
    }

    Navigator.pop(mContext);
  }
}

class ChatRoomDetailModel {
  List<dynamic> groupedChatList;

  ChatRoomDetailModel(this.groupedChatList);

  factory ChatRoomDetailModel.fromMap(List<dynamic> rawList) {
    if (rawList.isEmpty || rawList.any((e) => e is! Map)) {
      return ChatRoomDetailModel([]);
    }

    // 메시지 날짜 기준으로 묶기
    Map<String, List<ChatRoom>> grouped = {};

    for (final map in rawList) {
      final date = DateTime.parse(map['createdAt']).toLocal();
      final dateKey =
          "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

      final chatRoom = ChatRoom.fromMap(map);
      grouped.putIfAbsent(dateKey, () => []).add(chatRoom);
    }

    final sortedKeys = grouped.keys.toList()..sort();

    for (final key in sortedKeys) {
      grouped[key]!
          .sort((a, b) => a.chat.createdAt.compareTo(b.chat.createdAt));
    }

    List<dynamic> finalList = [];
    for (final date in sortedKeys) {
      finalList.add(date);
      finalList.addAll(grouped[date]!);
    }

    return ChatRoomDetailModel(finalList);
  }

  ChatRoomDetailModel copyWith({
    List<dynamic>? groupedChatList,
  }) {
    return ChatRoomDetailModel(
      groupedChatList ?? this.groupedChatList,
    );
  }

  @override
  String toString() => 'ChatRoomDetailModel(groupedChatList: $groupedChatList)';
}
