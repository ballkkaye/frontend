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

  // Future<void> chat(int chatRoomId, String message) async {
  //   try {
  //     Map<String, dynamic> data = await ChatRoomRepository().chat(chatRoomId, message);
  //
  //     // 단일 메시지 Map → ChatRoom
  //     ChatRoom newChatRoom = ChatRoom.fromMap(data);
  //
  //     // 채팅 리스트 상태 갱신
  //     DateTime lastDate =
  //         state!.groupedChatList.reversed.firstWhere((e) => e is ChatRoom).chat.createdAt.toLocal();
  //     DateTime newDate = newChatRoom.chat.createdAt.toLocal();
  //
  //     String lastDateString =
  //         "${lastDate.year}-${lastDate.month.toString().padLeft(2, '0')}-${lastDate.day.toString().padLeft(2, '0')}";
  //     String newDateString =
  //         "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";
  //
  //     List<dynamic> newList = [...state!.groupedChatList];
  //
  //     if (lastDateString == newDateString) {
  //       newList.add(newChatRoom);
  //     } else {
  //       newList.add(newDateString);
  //       newList.add(newChatRoom);
  //     }
  //
  //     state = state!.copyWith(groupedChatList: newList);
  //   } catch (e) {
  //     ScaffoldMessenger.of(mContext).showSnackBar(
  //       SnackBar(content: Text("채팅 쓰기 실패: ${e.toString()}")),
  //     );
  //   }
  // }
}

class ChatRoomDetailModel {
  List<dynamic> groupedChatList;

  ChatRoomDetailModel(this.groupedChatList);

  factory ChatRoomDetailModel.fromMap(List<dynamic> rawList) {
    if (rawList.isEmpty) {
      return ChatRoomDetailModel([]); // 빈 채팅방 처리
    }

    // 메시지 날짜 기준으로 묶기
    Map<String, List<ChatRoom>> grouped = {};

    for (final map in rawList) {
      if (map['createdAt'] == null) continue;

      final date = DateTime.parse(map['createdAt']).toLocal();
      final dateKey =
          "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

      final chatRoom = ChatRoom.fromMap(map);
      grouped.putIfAbsent(dateKey, () => []).add(chatRoom);
    }

    final sortedKeys = grouped.keys.toList()..sort();

    for (final key in sortedKeys) {
      grouped[key]!
          .sort((a, b) => a.chat!.createdAt.compareTo(b.chat!.createdAt));
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
