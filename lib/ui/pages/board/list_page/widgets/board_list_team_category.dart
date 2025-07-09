import 'package:ballkkaye_frontend/ui/pages/board/list_page/board_list_team_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/widgets/board_list_team_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardListTeamCategory extends ConsumerWidget {
  const BoardListTeamCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BoardListTeamModel? teamModel = ref.watch(boardListTeamProvider);
    if (teamModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SizedBox(
          height: 85,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: teamModel.teams.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return BoardListTeamCategoryItem(label: '전체보기');
              } else {
                final team = teamModel.teams[index - 1];
                return BoardListTeamCategoryItem(
                  label: team.label,
                  imgUrl: team.teamLogo,
                  rank: team.teamRank,
                );
              }
            },
          ),
        ),
      );
    }
  }
}
