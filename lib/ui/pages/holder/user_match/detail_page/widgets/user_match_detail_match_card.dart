import 'package:flutter/material.dart';

import 'user_match_detail_match_row.dart';

class UserMatchDetailMatchCard extends StatelessWidget {
  const UserMatchDetailMatchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          UserMatchDetailMatchRow(label: '경기 일정', value: '2025.06.19'),
          SizedBox(height: 4),
          UserMatchDetailMatchRow(label: '경기', value: '롯데 vs 두산'),
          SizedBox(height: 4),
          UserMatchDetailMatchRow(label: '경기장', value: '사직 야구장'),
        ],
      ),
    );
  }
}
