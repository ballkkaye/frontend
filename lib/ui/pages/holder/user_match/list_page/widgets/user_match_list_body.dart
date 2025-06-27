import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/widgets/user_match_list_card.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/widgets/user_match_list_filter_dropdown.dart';
import 'package:flutter/material.dart';

class UserMatchListBody extends StatelessWidget {
  const UserMatchListBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              UserMatchListFilterDropdown(),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return UserMatchListCard();
            },
          ),
        ),
      ],
    );
  }
}
