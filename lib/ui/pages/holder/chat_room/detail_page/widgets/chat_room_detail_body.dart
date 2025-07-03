import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/widgets/detail_header.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/widgets/detail_input_field.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/widgets/detail_message_list.dart';
import 'package:flutter/material.dart';

class ChatRoomDetailBody extends StatelessWidget {
  ChatRoomDetailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        DetailHeader(),
        const SizedBox(height: 15),
        Expanded(
          child: DetailMessageList(),
        ),
        const Divider(height: 1),
        DetailInputField(),
      ],
    );
  }
}
