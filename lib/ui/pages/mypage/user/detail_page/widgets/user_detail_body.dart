import 'package:ballkkaye_frontend/data/gvm/session_gvm.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/user/detail_page/widgets/user_detail_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_detail_status_card.dart';

class UserDetailBody extends ConsumerWidget {
  UserDetailBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionModel model = ref.watch(sessionProvider);

    if (model.user == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상단 유저 카드
            UserDetailProfileCard(model.user!),
            const SizedBox(height: 10),
            // 하단 카드
            UserDetailStatusCard()
          ],
        ),
      );
    }
  }
}
