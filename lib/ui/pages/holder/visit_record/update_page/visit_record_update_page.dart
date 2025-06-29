import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/update_page/widgets/update_body.dart';
import 'package:flutter/material.dart';

class VisitRecordUpdatePage extends StatelessWidget {
  const VisitRecordUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: UpdateBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, "/visit-record/detail");
        },
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: MText.h1("기록 수정"),
      centerTitle: true,
    );
  }
}
