import 'package:ballkkaye_frontend/data/model/chat_room.dart';
import 'package:ballkkaye_frontend/data/repository/chat_room_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final chatRoomDetailProvider =
    AutoDisposeNotifierProvider.family<ChatRoomDetailVM, ChatRoomDetailModel?, int>(() {
  return ChatRoomDetailVM();
});

class ChatRoomDetailVM extends AutoDisposeFamilyNotifier<ChatRoomDetailModel?, int> {
  final mContext = navigatorKey.currentContext!;

  @override
  ChatRoomDetailModel? build(int chatRoomId) {
    state = ChatRoomDetailModel([]);

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
      grouped[key]!.sort((a, b) {
        if (a.chat == null || b.chat == null) return 0;
        return a.chat!.createdAt.compareTo(b.chat!.createdAt);
      });
    }

    List<dynamic> finalList = [];
    for (final date in sortedKeys) {
      finalList.add(date); // 날짜 헤더
      finalList.addAll(grouped[date]!); // 해당 날짜의 채팅들
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
