import 'package:ballkkaye_frontend/data/gvm/session_gvm.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/widgets/mypage_service_list.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/widgets/mypage_user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MypageBody extends ConsumerWidget {
  MypageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionModel model = ref.watch(sessionProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MypageUserCard(model.user!),
            const SizedBox(height: 10),
            MypageServiceList(),
          ],
        ),
      );
    }
  }
}
