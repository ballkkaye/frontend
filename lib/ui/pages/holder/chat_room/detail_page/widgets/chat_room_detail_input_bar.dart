import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/chat_room_detail_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatRoomDetailInputBar extends ConsumerStatefulWidget {
  const ChatRoomDetailInputBar({super.key});

  @override
  ConsumerState<ChatRoomDetailInputBar> createState() =>
      _ChatRoomDetailInputBarState();
}

class _ChatRoomDetailInputBarState
    extends ConsumerState<ChatRoomDetailInputBar> {
  final int chatRoomId = 1;
  final TextEditingController _chatController = TextEditingController();

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  void _sendMessage(ChatRoomDetailVM vm) {
    String msg = _chatController.text.trim();
    if (msg.isEmpty) return;

    print("보낸 메시지: $msg");

    vm.chat(chatRoomId, msg);
    _chatController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.read(chatRoomDetailProvider(chatRoomId).notifier);

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
              onSubmitted: (_) => _sendMessage(vm),
              decoration: InputDecoration(
                hintText: "메시지를 입력하세요",
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
            ),
          ),
          SizedBox(width: 8),
          InkWell(
            onTap: () => _sendMessage(vm),
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
