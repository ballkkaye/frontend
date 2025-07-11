import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/chat.dart';
import 'package:flutter/material.dart';

class ChatRoomDetailMessageBubble extends StatelessWidget {
  Chat chat;

  ChatRoomDetailMessageBubble(this.chat);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          chat.isOwner ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (!chat.isOwner)
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 5),
            child: MText.normal7_4(
              chat.user.name!,
              color: MColor.kLabel.normal,
            ),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (chat.isOwner)
              MText.normal8_4(
                _formatTime(chat.createdAt),
                color: MColor.kLabel.normal,
              ),
            const SizedBox(width: 4),
            Container(
              constraints: BoxConstraints(
                maxWidth: 300,
              ),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                color:
                    chat.isOwner ? MColor.kPrimary.heavy : MColor.kFill.normal,
                borderRadius: BorderRadius.circular(16),
              ),
              child: MText.normal6_4(
                chat.message,
                color:
                    chat.isOwner ? MColor.kLabel.white : MColor.kLabel.normal,
              ),
            ),
            const SizedBox(width: 2),
            if (!chat.isOwner)
              MText.normal8_4(
                _formatTime(chat.createdAt),
                color: MColor.kLabel.normal,
              ),
          ],
        ),
      ],
    );
  }
}

String _formatTime(DateTime dt) {
  final local = dt.toLocal();
  final hour = local.hour;
  final min = local.minute.toString().padLeft(2, '0');
  final isPM = hour >= 12;
  final hour12 = isPM ? (hour == 12 ? 12 : hour - 12) : (hour == 0 ? 12 : hour);
  final period = isPM ? "오후" : "오전";
  return "$period $hour12:$min";
}
