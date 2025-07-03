import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/list_page/chat_room_list_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/widgets/chat_room_leave_btn.dart';
import 'package:flutter/material.dart';

import 'widgets/chat_room_detail_body.dart';

class ChatRoomDetailPage extends StatelessWidget {
  const ChatRoomDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _appbar(context),
      body: ChatRoomDetailBody(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ChatRoomListPage()),
          );
        }),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      title: MText.h1('직관같이갑시다', color: MColor.kLabel.normal),
      centerTitle: true,
      actions: [
        ChatRoomLeaveBtn(
          icon: MIcon.nav.top.dotHorizontal,
          onConfirm: () {
            print("detail에서 채팅방 나감");
          },
        ),
      ],
    );
  }
}
