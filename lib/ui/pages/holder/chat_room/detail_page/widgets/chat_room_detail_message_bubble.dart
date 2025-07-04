import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class ChatRoomDetailMessageBubble extends StatelessWidget {
  final Map<String, dynamic> message;

  const ChatRoomDetailMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message['me'] == true;

    return Column(
      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (!isMe)
          MText.normal7_4(
            message['user'],
            color: MColor.kLabel.normal,
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (isMe)
              MText.normal8_4(
                message['time'],
                color: MColor.kLabel.normal,
              ),
            const SizedBox(width: 4),
            Container(
              constraints: BoxConstraints(
                maxWidth: 300,
              ),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                color: isMe ? MColor.kPrimary.heavy : MColor.kFill.normal,
                borderRadius: BorderRadius.circular(16),
              ),
              child: MText.normal6_4(
                message['text']!,
                color: isMe ? MColor.kLabel.white : MColor.kLabel.normal,
                // 더보기 버튼을 통해 채팅 전체 화면을 보여주는 화면이 있으면, ...으로 생략할 수 있는 코드.
                // 현재는 채팅한 전체 내용이 다 보이게 됨.
                // overflow: TextOverflow.ellipsis,
                // maxLines: 6,
              ),
            ),
            const SizedBox(width: 2),
            if (!isMe)
              MText.normal8_4(
                message['time'],
                color: MColor.kLabel.normal,
              ),
          ],
        ),
      ],
    );
  }
}
