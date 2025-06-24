import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/widgets/user_match_list_card.dart';
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
          child: Row(
            children: [
              _buildFilterChip("성별"),
              SizedBox(width: 12),
              _buildFilterChip("연령대"),
              SizedBox(width: 12),
              _buildFilterChip("응원팀"),
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

  Widget _buildFilterChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: const TextStyle(fontSize: 14)),
    );
  }
}
