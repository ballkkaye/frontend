import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/board_list_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/widgets/list_team_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'list_card.dart';

class BoardListBody extends ConsumerStatefulWidget {
  final String accessToken;

  const BoardListBody({
    super.key,
    required this.accessToken,
  });

  @override
  ConsumerState<BoardListBody> createState() => _BoardListBodyState();
}

class _BoardListBodyState extends ConsumerState<BoardListBody> {
  @override
  void initState() {
    super.initState();

    // initState에서 최초 1번만
    Future.microtask(() {
      print("==== BoardListBody accessToken: ${widget.accessToken}");
      ref.read(boardListProvider.notifier).init(accessToken: widget.accessToken);
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(boardListProvider);

    if (model == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        // 팀 카테고리
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: model.teams.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const ListTeamCategoryItem(label: '전체보기');
                } else {
                  final team = model.teams[index - 1];
                  return ListTeamCategoryItem(
                    label: team.teamName,
                    imgUrl: team.teamLogo,
                    rank: team.teamRank,
                  );
                }
              },
            ),
          ),
        ),
        Divider(color: MColor.kLine.normal),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: model.items.length,
              itemBuilder: (context, index) {
                final item = model.items[index];
                return ListCard(boardItem: item);
              },
            ),
          ),
        ),
      ],
    );
  }
}
