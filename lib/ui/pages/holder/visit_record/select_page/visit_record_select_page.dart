import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class VisitRecordSelectPage extends StatelessWidget {
  const VisitRecordSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Column(
        children: [
          MText.h3_6("날짜 선택"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/visit-record/write");
        },
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      title: MText.h1("직관 기록 작성"),
      centerTitle: true,
    );
  }
}
