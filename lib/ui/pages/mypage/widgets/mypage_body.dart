import 'package:ballkkaye_frontend/ui/pages/mypage/widgets/mypage_service_list.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/widgets/mypage_user_card.dart';
import 'package:flutter/material.dart';

class MypageBody extends StatelessWidget {
  MypageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MypageUserCard(),
            const SizedBox(height: 10),
            MypageServiceList(),
          ],
        ),
      ),
    );
  }
}
