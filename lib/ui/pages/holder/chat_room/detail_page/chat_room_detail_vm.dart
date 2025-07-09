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

  Future<void> chat(int chatRoomId, String message) async {
    Map<String, dynamic> data =
        await ChatRoomRepository().chat(chatRoomId, message);

    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("채팅 쓰기 실패 : ${data["msg"]}")),
      );
      return;
    }

    // 3. 응답 파싱
    ChatRoom newChatRoom = ChatRoom.fromMap(data["body"]);
    final newDate = newChatRoom.chat.createdAt.toLocal();
    final newDateKey =
        "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

    // 4. 기존 상태 복사
    List<dynamic> newList = [...state!.groupedChatList];

    // 5. 날짜 헤더가 이미 있는지 확인
    final dateIndex = newList.indexWhere((element) => element == newDateKey);

    if (dateIndex != -1) {
      // 해당 날짜가 이미 있는 경우 → 해당 날짜 다음 위치에 삽입
      int insertIndex = dateIndex + 1;

      // 다음 날짜 헤더가 나오기 전까지 찾아서 맨 아래에 삽입
      while (insertIndex < newList.length && newList[insertIndex] is ChatRoom) {
        final chatRoom = newList[insertIndex] as ChatRoom;
        final chatDate = chatRoom.chat.createdAt.toLocal();
        final chatDateKey =
            "${chatDate.year}-${chatDate.month.toString().padLeft(2, '0')}-${chatDate.day.toString().padLeft(2, '0')}";
        if (chatDateKey != newDateKey) break;
        insertIndex++;
      }

      newList.insert(insertIndex, newChatRoom);
    } else {
      // 해당 날짜가 없으면 → 맨 앞에 날짜 헤더 + 채팅 삽입
      newList.insert(0, newChatRoom);
      newList.insert(0, newDateKey);
    }

    state = state!.copyWith(groupedChatList: newList);
  }
}

class ChatRoomDetailModel {
  List<dynamic> groupedChatList;

  ChatRoomDetailModel(this.groupedChatList);

  factory ChatRoomDetailModel.fromMap(List<dynamic> rawList) {
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
