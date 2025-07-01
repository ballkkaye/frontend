import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/board/update_page/widgets/board_update_body.dart';
import 'package:flutter/material.dart';

class BoardUpdatePage extends StatelessWidget {
  const BoardUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: BoardUpdateBody(),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: MText.h1("글수정"),
      centerTitle: true,
    );
  }
}
