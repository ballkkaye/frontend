import 'package:ballkkaye_frontend/ui/pages/board/list_page/board_list_board_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/widgets/board_list_card.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/widgets/board_list_team_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_core/style/m_color.dart';

class BoardListBody extends ConsumerWidget {
  const BoardListBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Model = ref.watch(boardListProvider);
    if (Model == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Column(
      children: [
        // 팀 카테고리
        BoardListTeamCategory(),
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
              itemCount: Model.boards.length,
              itemBuilder: (context, index) {
                final item = Model.boards[index];
                return BoardListCard(item);
              },
            ),
          ),
        ),
      ],
    );
  }
}
