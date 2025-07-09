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
}

class ChatRoomDetailModel {
  List<dynamic> groupedChatList;

  ChatRoomDetailModel(this.groupedChatList);

  factory ChatRoomDetailModel.fromMap(List<dynamic> rawList) {
    // 1. 메시지를 날짜 기준으로 묶기
    Map<String, List<ChatRoom>> grouped = {};

    for (final map in rawList) {
      final date =
          DateTime.parse(map['createdAt']).toLocal(); // toLocal()로 시간대 보정
      final dateKey =
          "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

      final chatRoom = ChatRoom.fromMap(map);
      grouped.putIfAbsent(dateKey, () => []).add(chatRoom);
    }

    // 2. 날짜 오름차순으로 정렬 후 날짜 + 메시지 묶기
    List<dynamic> finalList = [];
    final sortedKeys = grouped.keys.toList()..sort();

    for (final date in sortedKeys) {
      finalList.add(date); // 날짜 헤더
      finalList.addAll(grouped[date]!); // 해당 날짜 메시지들
    }

    return ChatRoomDetailModel(finalList);
  }

  @override
  String toString() => 'ChatRoomDetailModel(groupedChatList: $groupedChatList)';
}
