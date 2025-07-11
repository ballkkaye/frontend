import 'package:ballkkaye_frontend/data/model/chat.dart';

class ChatRoom {
  final Chat chat;
  final int chatRoomId;

  ChatRoom.fromMap(Map<String, dynamic> map)
      : chat = Chat.fromMap(map),
        chatRoomId = map['chatRoomId'];

  @override
  String toString() {
    return 'ChatRoom{chat: $chat, chatRoomId: $chatRoomId}';
  }
}
