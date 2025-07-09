import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/detail_page/user_match_detail_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/detail_page/widgets/user_match_detail_action_bar.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/detail_page/widgets/user_match_detail_match_card.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/detail_page/widgets/user_match_detail_profile.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/detail_page/widgets/user_match_detail_tag_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserMatchDetailBody extends ConsumerWidget {
  final int userMatchId;

  const UserMatchDetailBody(this.userMatchId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserMatchDetailModel? model = ref.watch(UserMatchDetailProvider(userMatchId));

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.9),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 22),
                  UserMatchDetailProfile(model.userMatch),
                  SizedBox(height: 22),
                  MText.normal4_6(model.userMatch.title, color: MColor.kLabel.normal),
                  SizedBox(height: 13.5),
                  MText.normal6_4('${model.userMatch.content}', color: MColor.kLabel.normal),
                  SizedBox(height: 22),

                  Spacer(),

                  // 경기 정보 카드
                  UserMatchDetailMatchCard(model.userMatch.game),
                  SizedBox(height: 9),

                  // 태그들
                  UserMatchDetailTagGroup(model.userMatch),
                  SizedBox(height: 22),

                  // 참여 인원 + 버튼
                  UserMatchDetailActionBar(model.userMatch),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
