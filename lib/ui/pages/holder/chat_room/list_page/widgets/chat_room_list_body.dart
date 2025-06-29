import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/list_page/widgets/chat_room_list_item.dart';
import 'package:flutter/material.dart';

class ChatRoomListBody extends StatelessWidget {
  ChatRoomListBody({super.key});

  final List<Map<String, String>> chatRooms = [
    {'name': '채팅방이름', 'time': '15분전'},
    {'name': '채팅방이름', 'time': '16분전'},
    {'name': '채팅방이름', 'time': '15분전'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 상단 디바이더
        Divider(height: 1, color: MColor.kLine.normal),

        Expanded(
          child: ListView.builder(
            itemCount: chatRooms.length,
            itemBuilder: (context, index) {
              final chat = chatRooms[index];
              return ChatRoomListItem(chat: chat);
            },
          ),
        ),
      ],
    );
  }
}
