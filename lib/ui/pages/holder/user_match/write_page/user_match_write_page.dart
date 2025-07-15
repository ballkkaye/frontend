import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/write_page/widgets/user_match_write_body.dart';
import 'package:flutter/material.dart';

class UserMatchWritePage extends StatelessWidget {
  Game selectedGame;

  UserMatchWritePage({super.key, required this.selectedGame});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: UserMatchWriteBody(selectedGame: selectedGame),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, "/user-match/detail");
      //   },
      // ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      centerTitle: true,
      title: MText.h1('동행 작성', color: MColor.kLabel.normal),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    );
  }
}
