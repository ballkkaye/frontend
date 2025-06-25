import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/widgets/m_select_button.dart';
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
              MSelectButton(
                hintText: '성별',
                options: ['남자', '여자'],
              ),
              SizedBox(width: 12),
              MSelectButton(
                hintText: '연령대',
                options: ['10대', '20대', "30대"],
              ),
              SizedBox(width: 8),
              MSelectButton(
                hintText: '응원팀',
                options: ['롯데 자이언츠', '두산 베어스'],
              ),
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
