import 'package:ballkkaye_frontend/ui/pages/mypage/user/detail_page/widgets/user_detail_profile_card.dart';
import 'package:flutter/material.dart';

import 'user_detail_status_card.dart';

class UserDetailBody extends StatelessWidget {
  const UserDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상단 유저 카드
            UserDetailProfileCard(),
            const SizedBox(height: 10),
            // 하단 카드
            UserDetailStatusCard()
          ],
        ),
      ),
    );
  }
}
