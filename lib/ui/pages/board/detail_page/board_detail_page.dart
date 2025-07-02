import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/board_detail_body.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/detail_reply_input_bar.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_alert_dialog.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_update_delete_action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoardDetailPage extends StatelessWidget {
  BoardDetailPage({super.key});

  TextEditingController _replyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: BoardDetailBody(replyController: _replyController),
      // 댓글 입력창
      bottomNavigationBar: DetailReplyInputBar(replyController: _replyController),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      title: MText.h1("커뮤니티"),
      centerTitle: true,
      actions: [
        Visibility(
          visible: true, // bool isBoardOwner = true; // 게시글 주인 판별 -> 더보기 버튼
          child: IconButton(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return MUpdateDeleteActionSheet(
                    onUpdate: () {
                      Navigator.popAndPushNamed(context, '/board/update');
                    },
                    onDelete: () {
                      Navigator.pop(context);
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) => MAlertDialog(
                          title: '게시글 삭제',
                          content: '게시글을 삭제하시겠습니까?',
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
            },
            icon: MIcon.nav.top.dotHorizontal,
          ),
        ),
      ],
    );
  }
}
