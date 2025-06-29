import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/widgets/chat_room_detail_message_profile.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/widgets/chat_room_detail_message_bubble.dart';
import 'package:flutter/material.dart';

class ChatRoomDetailMessageList extends StatelessWidget {
  ChatRoomDetailMessageList({super.key});

  final List<Map<String, dynamic>> messages = [
    {'user': 'love', 'text': '같이가실?', 'me': false, 'time': '오후 7:51'},
    {'user': 'cos', 'text': 'ㅇㅇ', 'me': false, 'time': '오후 7:51'},
    {'user': 'me', 'text': '와 안되겠습니까', 'me': true, 'time': '오후 7:51'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        final isMe = message['me'] == true;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isMe) ...[
                ChatRoomDetailMessageProfile(user: message['user']),
                const SizedBox(width: 10),
              ],
              ChatRoomDetailMessageBubble(message: message),
              if (isMe) const SizedBox(width: 10),
            ],
          ),
        );
      },
    );
  }
}