import 'package:ballkkaye_frontend/data/model/user.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/user/detail_page/widgets/user_detail_profile_card.dart';
import 'package:flutter/material.dart';

import 'user_detail_status_card.dart';

class UserDetailBody extends StatelessWidget {
  User user;

  UserDetailBody(this.user);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 상단 유저 카드
          UserDetailProfileCard(user),
          const SizedBox(height: 10),
          // 하단 카드
          UserDetailStatusCard()
        ],
      ),
    );
  }
}
