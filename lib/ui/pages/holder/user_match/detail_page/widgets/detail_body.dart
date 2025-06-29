import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

import 'detail_action_bar.dart';
import 'detail_match_card.dart';
import 'detail_profile.dart';
import 'detail_tag_group.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목 + 시간
          SizedBox(height: 23),
          DetailProfile(),
          SizedBox(height: 32),
          MText.h3_6('직관같이갑시다'),
          SizedBox(height: 13.5),
          Text('같이 응원을 열심히 하는 사람들만\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),

          Spacer(),

          // 경기 정보 카드
          DetailMatchCard(),

          SizedBox(height: 9),

          // 태그들
          DetailTagGroup(),

          SizedBox(height: 23),

          // 참여 인원 + 버튼
          DetailActionBar(),

          SizedBox(height: 30),
        ],
      ),
    );
  }
}
