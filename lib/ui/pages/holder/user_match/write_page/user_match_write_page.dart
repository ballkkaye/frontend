import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/write_page/widgets/user_match_write_body.dart';
import 'package:flutter/material.dart';

class UserMatchWritePage extends StatelessWidget {
  const UserMatchWritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: UserMatchWriteBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/user-match/detail");
        },
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: MText.h1("동행 작성", color: MColor.kLabel.normal),
      centerTitle: true,
    );
  }
}
