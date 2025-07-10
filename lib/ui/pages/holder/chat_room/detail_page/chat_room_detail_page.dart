import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/_core/utils/m_socket.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/list_page/chat_room_list_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/widgets/chat_room_leave_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/chat_room_detail_body.dart';

class ChatRoomDetailPage extends ConsumerWidget {
  int chatRoomId;

  ChatRoomDetailPage(this.chatRoomId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _appbar(context, ref),
      body: ChatRoomDetailBody(chatRoomId),
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

  AppBar _appbar(BuildContext context, WidgetRef ref) {
    return AppBar(
      centerTitle: true,
      title: MText.h1('직관같이갑시다', color: MColor.kLabel.normal),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      actions: [
        ChatRoomLeaveBtn(
          icon: MIcon.nav.top.dotHorizontal,
          onConfirm: () async {
            MSocket(ref as Ref).disconnect(chatRoomId);
            if (isOwner) {
              await ChatRoomRepository().delete(chatRoomId);
            } else {
              await ChatRoomRepository().leave(chatRoomId);
            }
            print("detail에서 채팅방 나감");
          },
        ),
      ],
    );
  }
}
