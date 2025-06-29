import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/visit_record_write_body.dart';
import 'package:flutter/material.dart';

class VisitRecordWritePage extends StatelessWidget {
  const VisitRecordWritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: VisitRecordWriteBody(),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: MText.h1("기록 작성"),
      centerTitle: true,
    );
  }
}
