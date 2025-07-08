import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/board_list_board_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/board_list_team_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/widgets/board_list_card.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/widgets/board_list_team_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardListBody extends ConsumerStatefulWidget {
  const BoardListBody({
    super.key,
  });

  @override
  ConsumerState<BoardListBody> createState() => _BoardListBodyState();
}

class _BoardListBodyState extends ConsumerState<BoardListBody> {
  @override
  void initState() {
    super.initState();

    // initState에서 최초 1번만
  }

  @override
  Widget build(BuildContext context) {
    final boardModel = ref.watch(boardListProvider);
    final teamModel = ref.watch(boardListTeamProvider);
    if (boardModel == null || teamModel == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Column(
      children: [
        // 팀 카테고리
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SizedBox(
            height: 85,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: teamModel.teams.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const BoardListTeamCategory(label: '전체보기');
                } else {
                  final team = teamModel.teams[index - 1];
                  return BoardListTeamCategory(
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
              itemCount: boardModel.boards.length,
              itemBuilder: (context, index) {
                final item = boardModel.boards[index];
                return BoardListCard(board: item);
              },
            ),
          ),
        ),
      ],
    );
  }
}
