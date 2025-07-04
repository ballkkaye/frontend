import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/widgets/user_match_list_card.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/widgets/user_match_list_filter_dropdown.dart';
import 'package:flutter/material.dart';

class UserMatchListBody extends StatelessWidget {
  const UserMatchListBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          child: UserMatchListFilterDropdown(),
        )),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => UserMatchListCard(),
            childCount: 6,
          ),
        ),
      ],
    );
  }
}
