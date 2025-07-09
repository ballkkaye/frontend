import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatRoomDetailInputBar extends StatefulWidget {
  const ChatRoomDetailInputBar({
    super.key,
  });

  @override
  State<ChatRoomDetailInputBar> createState() => _ChatRoomDetailInputBarState();
}

class _ChatRoomDetailInputBarState extends State<ChatRoomDetailInputBar> {
  final TextEditingController _chatController = TextEditingController();

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    String msg = _chatController.text.trim();
    if (msg.isEmpty) return;

    print("보낸 메시지: $msg");

    // vm.chat(msg);

    _chatController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MColor.kBackground.alternative,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Icon(
              CupertinoIcons.add,
              color: MColor.kLabel.neutral,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _chatController,
              onSubmitted: (_) => _sendMessage(),
              decoration: InputDecoration(
                hintText: "메시지를 입력하세요",
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
            ),
          ),
          SizedBox(width: 8),
          InkWell(
            onTap: _sendMessage,
            child: Icon(
              CupertinoIcons.arrow_up,
              color: MColor.kLabel.neutral,
            ),
          ),
        ],
      ),
    );
  }
}
