import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/update_page/widgets/visit_record_update_body.dart';
import 'package:flutter/material.dart';

class VisitRecordUpdatePage extends StatelessWidget {
  const VisitRecordUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: VisitRecordUpdateBody(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.popAndPushNamed(context, "/visit-record/detail");
      //   },
      // ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      centerTitle: true,
      title: MText.h1('기록 수정', color: MColor.kLabel.normal),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    );
  }
}
