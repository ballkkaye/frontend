import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/board_list_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/list_page/chat_room_list_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/prediction_page/prediction_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/rainout_prediction_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/ranking_page/ranking_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/today_game_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/list_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/visit_record_list_page.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/widgets/mypage_service_item.dart';
import 'package:flutter/material.dart';

class MypageServiceList extends StatelessWidget {
  MypageServiceList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> serviceItems = [
      ServiceItem(
        icon: MIcon.page.mypage.prediction,
        label: '승리예측',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PredictionPage()),
          );
        },
      ),
      ServiceItem(
        icon: MIcon.page.mypage.rain,
        label: '우천 취소 예측',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => RainoutPredictionPage()),
          );
        },
      ),
      ServiceItem(
        icon: MIcon.page.mypage.record,
        label: '나의 승부 예측',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => UserPredictionPage()),
          );
        },
      ),
      ServiceItem(
        icon: MIcon.page.mypage.todayGame,
        label: '오늘의 경기',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => TodayGamePage()),
          );
        },
      ),
      ServiceItem(
        icon: MIcon.page.mypage.record,
        label: '팀 순위',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => RankingPage()),
          );
        },
      ),
      ServiceItem(
        icon: MIcon.page.mypage.match,
        label: '동행',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => UserMatchListPage()),
          );
        },
      ),
      ServiceItem(
        icon: MIcon.page.mypage.chat,
        label: '채팅',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ChatRoomListPage()),
          );
        },
      ),
      ServiceItem(
        icon: MIcon.page.mypage.record,
        label: '직관기록',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => VisitRecordListPage()),
          );
        },
      ),
      ServiceItem(
        icon: MIcon.page.mypage.community,
        label: '커뮤니티',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => BoardListPage()),
          );
        },
      ),
    ];

    return Container(
      decoration: BoxDecoration(
          color: MColor.kBackground.normal, borderRadius: BorderRadius.circular(12), boxShadow: MColor.kShadow.normal),
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
