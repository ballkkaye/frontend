import 'package:ballkkaye_frontend/data/model/user.dart';

class Chat {
  final int messageId; // 채팅 id
  final User user;
  final String message; // 채팅의 내용
  final String messageType; // 채팅의 타입
  final bool isOwner; // 채팅의 주인
  final DateTime createdAt;

  Chat({
    required this.messageId,
    required this.user,
    required this.message,
    required this.messageType,
    required this.isOwner,
    required this.createdAt,
  });

  Chat.fromMap(Map<String, dynamic> data)
      : messageId = data['messageId'] ?? data['id'],
        user = User(
          id: data['senderId'],
          name: data['senderName'],
        ),
        message = data['message'],
        messageType = data['messageType'],
        isOwner = data['isOwner'] ?? data['isSender'],
        createdAt = DateTime.parse(data['createdAt']);

  @override
  String toString() {
    return 'Chat{messageId: $messageId, user: $user, message: $message, messageType: $messageType, isOwner: $isOwner, createdAt: $createdAt}';
  }
}
