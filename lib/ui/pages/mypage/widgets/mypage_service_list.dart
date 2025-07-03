import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/widgets/mypage_service_item.dart';
import 'package:flutter/material.dart';

class MypageServiceList extends StatelessWidget {
  const MypageServiceList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> serviceItems = [
      ServiceItem(
        icon: MIcon.page.mypage.prediction,
        label: '승리예측',
        onTap: () {
          Navigator.pushNamed(context, '/game-center/prediction');
        },
      ),
      ServiceItem(
        icon: MIcon.page.mypage.rain,
        label: '우천 취소 예측',
        onTap: () {
          Navigator.pushNamed(context, '/game-center/rainout-prediction');
        },
      ),
      ServiceItem(
        icon: MIcon.page.mypage.record,
        label: '나의 승부 예측',
        onTap: () {
          Navigator.pushNamed(context, '/game-center/user-prediction');
        },
      ),
      ServiceItem(
        icon: MIcon.page.mypage.todayGame,
        label: '오늘의 경기',
        onTap: () {
          Navigator.pushNamed(context, '/game-center/today-game');
        },
      ),
      ServiceItem(
        icon: MIcon.page.mypage.record,
        label: '팀 순위',
        onTap: () {
          Navigator.pushNamed(context, '/game-center/ranking');
        },
      ),
      ServiceItem(
        icon: MIcon.page.mypage.match,
        label: '동행',
        onTap: () {
          Navigator.pushNamed(context, '/user-match/list');
        },
      ),
      ServiceItem(
        icon: MIcon.page.mypage.chat,
        label: '채팅',
        onTap: () {
          Navigator.pushNamed(context, '/chat-room/list');
        },
      ),
      ServiceItem(
        icon: MIcon.page.mypage.record,
        label: '직관기록',
        onTap: () {
          Navigator.pushNamed(context, '/visit-record/list');
        },
      ),
      ServiceItem(
        icon: MIcon.page.mypage.community,
        label: '커뮤니티',
        onTap: () {
          Navigator.pushNamed(context, '/board/list');
        },
      ),
    ];

    return Container(
      decoration: BoxDecoration(
          color: MColor.kBackground.normal,
          borderRadius: BorderRadius.circular(12),
          boxShadow: MColor.kShadow.normal),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '서비스',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 19),
            SizedBox(
              height: 420, // 스크롤 없게 고정
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: serviceItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: 0),
                itemBuilder: (context, index) => serviceItems[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
