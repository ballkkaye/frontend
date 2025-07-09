import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/widgets/board_list_body.dart';
import 'package:flutter/material.dart';

class BoardListPage extends StatelessWidget {
  const BoardListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      floatingActionButton: _floatingActionButton(context),
      body: BoardListBody(),
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, "/board/write");
      },
      shape: CircleBorder(),
      backgroundColor: MColor.kPrimary.strong,
      foregroundColor: Colors.white,
      child: MIcon.page.community.write,
    );
  }

  AppBar _appbar() {
    return AppBar(
      centerTitle: true,
      title: MText.h1('커뮤니티', color: MColor.kLabel.normal),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    );
  }
}
