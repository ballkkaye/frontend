import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/user_match_list_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/widgets/user_match_list_card.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/widgets/user_match_list_filter_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserMatchListBody extends ConsumerWidget {
  UserMatchListBody({
    super.key,
  });

  final _filterKey = GlobalKey<UserMatchListFilterAreaState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserMatchListModel? model = ref.watch(userMatchListProvider);
    UserMatchListVM vm = ref.read(userMatchListProvider.notifier);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return SmartRefresher(
        controller: vm.refreshCtrl,
        enablePullDown: true,
        onRefresh: () {
          _filterKey.currentState?.resetFilters();
          vm.init();
        },
        enablePullUp: true,
        onLoading: () {
          vm.nextList();
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.only(
                top: 22,
                left: 16,
                right: 16,
                bottom: 12,
              ),
              child: UserMatchListFilterArea(key: _filterKey, model: model),
            )),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => UserMatchListCard(model.userMatches[index]),
                childCount: model.userMatches.length,
              ),
            ),
          ],
        ),
      );
    }
  }
}
