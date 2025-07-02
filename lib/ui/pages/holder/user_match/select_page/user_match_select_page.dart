import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/select_page/widgets/select_body.dart';
import 'package:flutter/material.dart';

class UserMatchSelectPage extends StatelessWidget {
  const UserMatchSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: SelectBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/user-match/write");
        },
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: MText.h1("동행 작성"),
      centerTitle: true,
    );
  }
}
