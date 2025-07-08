import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/board_list_board_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/widgets/board_list_card.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/widgets/board_list_team_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardListBody extends ConsumerWidget {
  const BoardListBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BoardListBoardModel? boardModel = ref.watch(boardListBoardProvider);

    if (boardModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Column(
        children: [
          // 팀 카테고리 목록 (가로 스크롤)
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: MColor.kLine.normal,
              width: 1,
            ))),
            child: BoardListTeamCategory(),
          ),
          // 게시글 목록 (세로 스크롤)
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 16),
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: boardModel.boards.length,
              itemBuilder: (context, index) {
                return BoardListCard(boardModel.boards[index]);
              },
            ),
          ),
        ],
      );
    }
  }
}
