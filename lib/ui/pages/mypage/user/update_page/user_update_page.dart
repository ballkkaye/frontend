import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

import '../update_password_page/user_update_password_page.dart';
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
      centerTitle: true,
      title: MText.h1('프로필 수정', color: MColor.kLabel.normal),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      actions: [
        TextButton(
          onPressed: () {
            // 수정 로직
          },
          child: MText.label1_5('수정', color: MColor.kLabel.normal),
        ),
      ],
    );
  }
}
