import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/write_page/user_match_write_page.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_alert_dialog.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_update_delete_action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/detail_body.dart';

class UserMatchDetailPage extends StatelessWidget {
  const UserMatchDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: DetailBody(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 210),
        child: FloatingActionButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => UserMatchWritePage()),
          );
        }),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      title: MText.h1("동행"),
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
                    Navigator.popAndPushNamed(context, '/user-match/update');
                  },
                  onDelete: () {
                    Navigator.pop(context);
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) => MAlertDialog(
                        title: '동행글 삭제',
                        content: '동행글을 삭제하시겠습니까?',
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
