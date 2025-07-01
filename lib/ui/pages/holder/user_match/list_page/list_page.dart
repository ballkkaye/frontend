import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/detail_page/user_match_detail_page.dart';
import 'package:flutter/material.dart';

import 'widgets/list_page_body.dart';

class UserMatchListPage extends StatelessWidget {
  const UserMatchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColor.kBackground.normal,
      appBar: _appbar(context),
      body: UserMatchListBody(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => UserMatchDetailPage()),
        );
      }),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: MText.h1('동행', color: MColor.kLabel.normal),
      centerTitle: true,
      actions: [
        IconButton(
          icon: MIcon.nav.top.write,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => UserMatchDetailPage()),
            );
          },
        ),
      ],
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
