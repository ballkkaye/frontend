import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/widgets/chat_room_detail_message_bubble.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/widgets/chat_room_detail_message_profile.dart';
import 'package:flutter/material.dart';

class ChatRoomDetailMessageList extends StatelessWidget {
  ChatRoomDetailMessageList({super.key});

  final List<Map<String, dynamic>> messages = [
    {'messageType': 'enter', 'user': 'cos', 'text': 'cos님이 입장하셨습니다.', 'time': '오후 7:51'},
    {'messageType': 'talk', 'user': 'love', 'text': '같이가실?', 'me': false, 'time': '오후 7:51'},
    {'messageType': 'talk', 'user': 'me', 'text': '좋아요!', 'me': true, 'time': '오후 7:52'},
    {'messageType': 'exit', 'user': 'cos', 'text': 'cos님이 퇴장하셨습니다.', 'time': '오후 7:53'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        final isMe = message['me'] == true;
        if (message['messageType'] == 'enter' || message['messageType'] == 'exit') {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                message['text'],
                style: TextStyle(
                  color: MColor.kLabel.neutral,
                  fontSize: 12,
                ),
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isMe) ...[
                ChatRoomDetailMessageProfile(user: message['user']),
                const SizedBox(width: 10),
              ],
              ChatRoomDetailMessageBubble(message: message),
            ],
          ),
        );
      },
    );
  }
}
