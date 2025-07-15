import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

import 'widgets/user_match_list_body.dart';

class UserMatchListPage extends StatelessWidget {
  const UserMatchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColor.kBackground.normal,
      appBar: _appbar(context),
      body: UserMatchListBody(),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (_) => UserMatchDetailPage(5)),
      //   );
      // }),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: MText.h1('동행', color: MColor.kLabel.normal),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      actions: [
        IconButton(
          icon: MIcon.nav.top.write,
          onPressed: () {
            Navigator.pushNamed(context, '/user-match/select');
          },
        ),
      ],
    );
  }
}
