import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/user_match_list_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/widgets/user_match_list_card.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/widgets/user_match_list_filter_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserMatchListBody extends ConsumerWidget {
  const UserMatchListBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserMatchListModel? model = ref.watch(userMatchListProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.only(
              top: 22,
              left: 16,
              right: 16,
              bottom: 12,
            ),
            child: UserMatchListFilterArea(model),
          )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => UserMatchListCard(model.userMatches[index]),
              childCount: model.userMatches.length,
            ),
          ),
        ],
      );
    }
  }
}
