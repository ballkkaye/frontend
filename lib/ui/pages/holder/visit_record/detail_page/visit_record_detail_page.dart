import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/detail_page/widgets/detail_body.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_alert_dialog.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_update_delete_action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VisitRecordDetailPage extends StatelessWidget {
  const VisitRecordDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: DetailBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/visit-record/update");
        },
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      title: MText.h1("직관 기록"),
      centerTitle: true,
      actions: [
        // 더보기 버튼
        IconButton(
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return MUpdateDeleteActionSheet(
                  onUpdate: () {
                    Navigator.popAndPushNamed(context, '/visit-record/update');
                  },
                  onDelete: () {
                    Navigator.pop(context);
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) => MAlertDialog(
                        title: '직관 기록 삭제',
                        content: '직관 기록을 삭제하시겠습니까?',
                        onConfirm: () {
                          Navigator.pop(context); // TODO : 삭제 로직
                        },
                        onCancel: () {
                          Navigator.pop(context);
                        },
                        confirmText: '삭제',
                        cancelText: '취소',
                      ),
                    );
                  },
                );
              },
            );
          }, // TODO : 버튼 수정
          icon: MIcon.nav.top.dotHorizontal,
        ),
      ],
    );
  }
}
