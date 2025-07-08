import 'package:ballkkaye_frontend/ui/pages/board/list_page/board_list_board_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/board_list_team_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/widgets/board_list_team_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardListBody extends ConsumerWidget {
  const BoardListBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boardModel = ref.watch(boardListProvider);
    final teamModel = ref.watch(boardListTeamProvider);
    if (boardModel == null || teamModel == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return BoardListTeamCategory(teamModel: teamModel, boardModel: boardModel);
  }
}
