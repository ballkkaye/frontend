import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/widgets/chat_room_leave_btn.dart';
import 'package:flutter/material.dart';

import 'widgets/chat_room_detail_body.dart';

class ChatRoomDetailPage extends StatelessWidget {
  int chatRoomId;

  ChatRoomDetailPage(this.chatRoomId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _appbar(context),
      body: ChatRoomDetailBody(chatRoomId),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 50),
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (_) => ChatRoomListPage()),
      //       );
      //     },
      //   ),
      // ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      // title: MText.h1('직관같이갑시다', color: MColor.kLabel.normal),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
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
