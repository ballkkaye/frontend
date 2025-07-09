import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:ballkkaye_frontend/data/model/reply.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/borad_detail_board_area.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/borad_detail_reply_area.dart';
import 'package:flutter/material.dart';

class BoardDetailBody extends StatelessWidget {
  final Board board;
  final List<Reply> replies;
  final TextEditingController _replyController;

  BoardDetailBody({
    super.key,
    required this.board,
    required this.replies,
    required TextEditingController replyController,
  }) : _replyController = replyController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // 게시글 영역
          BoardDetailBoardArea(board),
          // model.board
          Divider(
            color: MColor.kFill.normal,
            thickness: 15,
          ),
          // 댓글 영역
          BoardDetailReplyArea(replyController: _replyController, replies: replies),
          // model.board.replies
        ],
      ),
    );
  }
}
