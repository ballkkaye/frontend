import 'package:ballkkaye_frontend/data/model/chat.dart';
import 'package:ballkkaye_frontend/data/model/user.dart';

class ChatRoom {
  final Chat? chat;
  final int chatRoomId;
  final String? chatRoomTitle;
  final String? relativeTime;
  final String? content;
  final int? chatRoomUserId;
  final List<User> users;

  ChatRoom(
    this.chat,
    this.chatRoomId,
    this.chatRoomTitle,
    this.relativeTime,
    this.content,
    this.chatRoomUserId,
    this.users,
  );

  ChatRoom.fromMap(Map<String, dynamic> data)
      : chat = (data['chat'] != null) ? Chat.fromMap(data['chat']) : null,
        chatRoomId = data['chatRoomId'],
        chatRoomTitle = data['chatRoomTitle'],
        relativeTime = data['relativeTime'],
        content = data['content'],
        chatRoomUserId = data['chatRoomUserId'],
        users = (data['userProfileImgs'] as List<dynamic>?)
                ?.map((userData) => User.fromMap({
                      'id': userData['userId'],
                      'nickname': userData['nickName'],
                      'profileUrl': userData['imgUrl'],
                    }))
                .toList() ??
            [];

  @override
  String toString() {
    return 'ChatRoom{chat: $chat, chatRoomId: $chatRoomId, chatRoomTitle: $chatRoomTitle, relativeTime: $relativeTime, content: $content, users: $users}';
  }
}
