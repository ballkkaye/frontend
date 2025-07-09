import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/widgets/chat_room_detail_header.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/widgets/chat_room_detail_input_bar.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/widgets/chat_room_detail_message_list.dart';
import 'package:flutter/material.dart';

class ChatRoomDetailBody extends StatelessWidget {
  ChatRoomDetailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        ChatRoomDetailHeader(),
        SizedBox(height: 15),
        Expanded(
          child: ChatRoomDetailMessageList(),
        ),
        ChatRoomDetailInputBar(),
      ],
    );
  }
}
