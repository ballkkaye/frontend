import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/list_page/chat_room_list_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/update_page/widgets/user_match_update_body.dart';
import 'package:flutter/material.dart';

class UserMatchUpdatePage extends StatelessWidget {
  const UserMatchUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MText.h1('동행 작성', color: MColor.kLabel.normal),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: UserMatchUpdateBody(),
        floatingActionButton: FloatingActionButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ChatRoomListPage()),
            );
          }),
    );
  }
}
