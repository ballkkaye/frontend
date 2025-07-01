import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/board_detail_body.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/detail_action_sheet.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/detail_reply_input_bar.dart';
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
      actions: [
        Visibility(
          visible: true, // bool isBoardOwner = true; // 게시글 주인 판별 -> 더보기 버튼
          child: IconButton(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return DetailActionSheet();
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
