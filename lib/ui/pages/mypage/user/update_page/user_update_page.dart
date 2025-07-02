import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

import 'user_update_password_page.dart';
import 'widgets/user_update_body.dart';

class UserUpdatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: UserUpdateBody(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => UserUpdatePasswordPage()),
        );
      }),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: MText.h1(
          '프로필 수정',
          color: MColor.kLabel.normal,
        ),
      ),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {
            // 수정 로직
          },
          child: MText.label1_5('수정', color: MColor.kLabel.normal),
        ),
      ],
      backgroundColor: MColor.kBackground.normal,
      toolbarHeight: 70,
    );
  }
}
