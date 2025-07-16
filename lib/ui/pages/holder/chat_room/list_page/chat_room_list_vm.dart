import 'package:ballkkaye_frontend/data/model/chat_room.dart';
import 'package:ballkkaye_frontend/data/repository/chat_room_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

final chatRoomListProvider = AutoDisposeNotifierProvider<ChatRoomListVM, ChatRoomListModel?>(() {
  return ChatRoomListVM();
});

class ChatRoomListVM extends AutoDisposeNotifier<ChatRoomListModel?> {
  final mContext = navigatorKey.currentContext!;
  final refreshCtrl = RefreshController();

  @override
  ChatRoomListModel? build() {
    init();

    ref.onDispose(() {
      Logger().d("ChatRoomListVM 파괴됨");
    });

    return null;
  }

  Future<void> init() async {
    Map<String, dynamic> data = await ChatRoomRepository().getList();
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("채팅 목록 통신 실패 : ${data["msg"]}")),
      );
      return;
    }

    state = ChatRoomListModel.fromList(data['body']);

    refreshCtrl.refreshCompleted();
  }

  Future<void> deleteOne(int chatRoomId) async {
    Map<String, dynamic> data = await ChatRoomRepository().deleteOne(chatRoomId);
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("채팅방 삭제 통신 실패 : ${data["msg"]}")),
      );
      return;
    }

    ChatRoomListModel model = state!;

    model.chatRooms = model.chatRooms.where((cr) => cr.chatRoomId != chatRoomId).toList();

    state = state!.copyWith(chatRooms: model.chatRooms);

    Navigator.pop(mContext);
  }

  Future<void> exitOne(int chatRoomUserId) async {
    Map<String, dynamic> data = await ChatRoomRepository().exitOne(chatRoomUserId);
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("채팅방 퇴장 통신 실패 : ${data["msg"]}")),
      );
      return;
    }

    ChatRoomListModel model = state!;

    model.chatRooms = model.chatRooms.where((cr) => cr.chatRoomUserId != chatRoomUserId).toList();

    state = state!.copyWith(chatRooms: model.chatRooms);

    Navigator.pop(mContext);
  }
}

class ChatRoomListModel {
  List<ChatRoom> chatRooms;

  ChatRoomListModel(
    this.chatRooms,
  );

  ChatRoomListModel.fromList(List<dynamic> list)
      : chatRooms = list.map((e) => ChatRoom.fromMap(e)).toList();

  ChatRoomListModel copyWith({
    List<ChatRoom>? chatRooms,
  }) {
    return ChatRoomListModel(
      chatRooms ?? this.chatRooms,
    );
  }

  @override
  String toString() {
    return 'ChatRoomListModel{userMatches: $chatRooms}';
  }
}
