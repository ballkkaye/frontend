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
  ChatRoom chatRoom;

  ChatRoomDetailModel(this.chatRoom);

  ChatRoomDetailModel.fromMap(Map<String, dynamic> data) : chatRoom = ChatRoom.fromMap(data);

  ChatRoomDetailModel copyWith(ChatRoom? chatRoom) {
    return ChatRoomDetailModel(chatRoom ?? this.chatRoom);
  }

  @override
  String toString() {
    return 'ChatRoomDetailModel{chatRoom: $chatRoom}';
  }
}
