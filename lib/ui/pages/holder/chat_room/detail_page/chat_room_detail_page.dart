

import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

import 'widgets/chat_room_detail_body.dart';

class ChatRoomDetailPage extends StatelessWidget {
  const ChatRoomDetailPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _appbar(),
      body: ChatRoomDetailBody(),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: MText.h1('직관같이갑시다',color: MColor.kLabel.normal),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 1,
      leading: const Icon(Icons.arrow_back, color: Colors.black),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: MIcon.nav.top.dotHorizontal,
        ),
      ],
    );
  }
}

