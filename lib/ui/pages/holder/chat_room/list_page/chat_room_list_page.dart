import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/chat_room_detail_page.dart';
import 'package:flutter/material.dart';

import 'widgets/chat_room_list_body.dart';

class ChatRoomListPage extends StatelessWidget {
  const ChatRoomListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: ChatRoomListBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ChatRoomDetailPage(1)), // TODO : chatRoomId 전달
          );
        },
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: MText.h1('채팅', color: MColor.kLabel.normal),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    );
  }
}
