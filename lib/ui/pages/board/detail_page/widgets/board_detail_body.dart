import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/borad_detail_board_area.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/borad_detail_reply_area.dart';
import 'package:flutter/material.dart';

class BoardDetailBody extends StatelessWidget {
  final Board detail;

  const BoardDetailBody({
    super.key,
    required TextEditingController replyController,
    required this.detail,
  }) : _replyController = replyController;

  final TextEditingController _replyController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // 게시글 영역
          BoardDetailBoardArea(detail: detail), // model.board
          Divider(
            color: MColor.kLabel.disable,
            thickness: 15,
          ),
          // 댓글 영역
          BoardDetailReplyArea(replyController: _replyController, replies: detail.replyItems), // model.board.replies
        ],
      ),
    );
  }
}
