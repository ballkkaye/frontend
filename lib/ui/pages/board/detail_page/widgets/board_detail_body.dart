import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/board_detail_board_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/borad_detail_board_area.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/borad_detail_reply_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardDetailBody extends ConsumerWidget {
  int boardId;

  BoardDetailBody({
    super.key,
    required this.boardId,
    required TextEditingController replyController,
  }) : _replyController = replyController;

  final TextEditingController _replyController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BoardDetailBoardModel? model = ref.watch(boardDetailBoardProvider(boardId));

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return SingleChildScrollView(
        child: Column(
          children: [
            // 게시글 영역
            BoardDetailBoardArea(model.board), // model.board
            Divider(
              color: MColor.kLabel.disable,
              thickness: 15,
            ),
            // 댓글 영역
            BoardDetailReplyArea(replyController: _replyController), // model.board.replies
          ],
        ),
      );
    }
  }
}
