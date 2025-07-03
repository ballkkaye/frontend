import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

import 'widgets/user_detail_body.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: UserDetailBody(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, '/user/update');
      }),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: MText.h1(
          '프로필',
          color: MColor.kLabel.normal,
        ),
      ),
      centerTitle: true,
      backgroundColor: MColor.kBackground.normal,
      elevation: 0,
      toolbarHeight: 70,
    );
  }
}
