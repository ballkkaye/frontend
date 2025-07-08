import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/board_list_board_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/board_list_team_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/widgets/board_list_card.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/widgets/board_list_team_category_list.dart';
import 'package:flutter/material.dart';

class BoardListTeamCategory extends StatelessWidget {
  const BoardListTeamCategory({
    super.key,
    required this.teamModel,
    required this.boardModel,
  });

  final BoardListTeamModel? teamModel;
  final BoardListModel? boardModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 팀 카테고리
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SizedBox(
            height: 85,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: teamModel!.teams.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const BoardListTeamCategoryList(label: '전체보기');
                } else {
                  final team = teamModel!.teams[index - 1];
                  return BoardListTeamCategoryList(
                    label: team.label,
                    imgUrl: team.teamLogo, // todo:나중에 이미지넣기
                    rank: team.teamRank,
                  );
                }
              },
            ),
          ),
        ),

        Divider(
          color: MColor.kLine.normal,
          thickness: 1,
        ),
        // 게시글 목록 (세로 스크롤)
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: boardModel!.boards.length,
              itemBuilder: (context, index) {
                final item = boardModel!.boards[index];
                return BoardListCard(board: item);
              },
            ),
          ),
        ),
      ],
    );
  }
}
