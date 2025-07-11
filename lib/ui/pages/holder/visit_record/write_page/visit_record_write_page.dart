import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/visit_record_write_body.dart';
import 'package:flutter/material.dart';

class VisitRecordWritePage extends StatelessWidget {
  final VisitRecord selectedGame;
  const VisitRecordWritePage({
    super.key,
    required this.selectedGame,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: VisitRecordWriteBody(selectedGame: selectedGame),
    );
  }

  AppBar _appbar() {
    return AppBar(
      centerTitle: true,
      title: MText.h1('기록 작성', color: MColor.kLabel.normal),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    );
  }
}
