import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/widgets/visit_record_list_body.dart';
import 'package:flutter/material.dart';

class VisitRecordListPage extends StatelessWidget {
  const VisitRecordListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cellSize = screenWidth * (47 / 360); // 디자인 비율 반영

    return Scaffold(
      appBar: _appbar(),
      body: VisitRecordListBody(cellSize: cellSize),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/visitrecord/write");
        },
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      title: MText.h1("직관 기록"),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {}, // TODO : 버튼 이동 수정
          icon: MIcon.nav.top.plus,
        ),
      ],
    );
  }
}
