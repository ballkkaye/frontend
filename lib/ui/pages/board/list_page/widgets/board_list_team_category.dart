import 'package:ballkkaye_frontend/ui/pages/board/list_page/board_list_team_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/widgets/board_list_team_category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardListTeamCategory extends ConsumerWidget {
  const BoardListTeamCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Model = ref.watch(boardListTeamProvider);

    if (Model == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // 팀 카테고리
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        height: 85,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Model.teams.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const BoardListTeamCategoryList(label: '전체보기');
            } else {
              final team = Model.teams[index - 1];
              return BoardListTeamCategoryList(
                label: team.label,
                imgUrl: team.teamLogo, // todo:나중에 이미지넣기
                rank: team.teamRank,
              );
            }
          },
        ),
      ),
    );
  }
}
