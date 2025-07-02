import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

import 'widgets/user_update_password_body.dart';

class UserUpdatePasswordPage extends StatelessWidget {
  const UserUpdatePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: UserUpdatePasswordBody(),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      title: MText.h1('비밀번호 변경', color: MColor.kLabel.normal),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

