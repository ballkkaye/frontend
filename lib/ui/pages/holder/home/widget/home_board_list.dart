import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/board_detail_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_board_content.dart';
import 'package:flutter/material.dart';

class HomeBoardList extends StatelessWidget {
  final List<Board> boards;

  const HomeBoardList({
    super.key,
    required this.boards,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: boards
          .map((board) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: InkWell(
                  onTap: () {
                    print('홈페이지: boardId: ${board.boardId}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BoardDetailPage(boardId: board.boardId), //
                      ),
                    );
                  },
                  child: HomeBoardContent(board: board),
                ),
              ))
          .toList(),
    );
  }
}
