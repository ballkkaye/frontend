import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/detail_page/widgets/visit_record_detail_body.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_more_option_btn.dart';
import 'package:flutter/material.dart';

class VisitRecordDetailPage extends StatelessWidget {
  const VisitRecordDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: VisitRecordDetailBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/visit-record/update");
        },
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: MText.h1('직관 기록', color: MColor.kLabel.normal),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      actions: [
        // 더보기 버튼
        MMoreOptionBtn(
          icon: MIcon.nav.top.dotHorizontal,
          onUpdate: () {
            Navigator.pushNamed(context, '/visit-record/update');
          },
          alertTitle: '직관 기록 삭제',
          alertContent: '직관 기록을 삭제하시겠습니까?',
          onAlertConfirm: () {},
          // 다이얼로그 닫힌 뒤 동작
          onAlertCancel: () {},
          // 다이얼로그 닫힌 뒤 동작
          alertConfirmText: '삭제',
          alertCancelText: '취소',
        ),
      ],
    );
  }
}
