import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/select_page/widgets/visit_record_select_body.dart';
import 'package:flutter/material.dart';

class VisitRecordSelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: VisitRecordSelectBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/visit-record/write");
        },
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: MText.h1("기록 작성"),
      centerTitle: true,
    );
  }
}
