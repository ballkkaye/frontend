import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/detail_page/widgets/user_match_detail_action_bar.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/detail_page/widgets/user_match_detail_match_card.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/detail_page/widgets/user_match_detail_profile.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/detail_page/widgets/user_match_detail_tag_group.dart';
import 'package:flutter/material.dart';

class UserMatchDetailBody extends StatelessWidget {
  const UserMatchDetailBody({
    super.key,
  });

  // constraints: BoxConstraints(
  // minHeight: 600, // 최대 높이 제한
  // ),

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                kToolbarHeight -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 제목 + 시간
                    SizedBox(height: 22),
                    UserMatchDetailProfile(),
                    SizedBox(height: 32),
                    MText.normal4_6('직관같이갑시다', color: MColor.kLabel.normal),
                    SizedBox(height: 13.5),
                    MText.normal6_4(
                      '같이 응원을 열심히 하는 사람들만\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!',
                      color: MColor.kLabel.normal,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Column(
                  children: [
                    // 경기 정보 카드
                    UserMatchDetailMatchCard(),
                    SizedBox(height: 9),
                    // 태그들
                    UserMatchDetailTagGroup(),
                    SizedBox(height: 23),
                    // 참여 인원 + 버튼
                    UserMatchDetailActionBar(),
                    SizedBox(height: 12),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
