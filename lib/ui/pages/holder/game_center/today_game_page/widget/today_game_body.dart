import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/widget/today_game_calender.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/widget/today_game_card.dart';
import 'package:flutter/material.dart';

class TodayGameBody extends StatelessWidget {
  const TodayGameBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 22, left: 16, right: 16),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TodayGameCalender(),
        ),
        SizedBox(height: 10),
        Column(
          children: [
            TodayGameCard(
              leftPhotoUrl: '',
              rightPhotoUrl: '',
              gameState: '경기예정',
              stadium: '고척',
              gameTime: TimeOfDay(hour: 18, minute: 20),
              broadcastInfo: 'SPO-2T',
              leftPitcher: '화이트',
              rightPitcher: '김윤하',
              ticketUrl: 'https://nol.interpark.com/ticket',
            ),
            TodayGameCard(
              leftPhotoUrl: '',
              rightPhotoUrl: '',
              gameState: '경기중',
              stadium: '고척',
              gameTime: TimeOfDay(hour: 18, minute: 20),
              broadcastInfo: 'SPO-2T',
              leftPitcher: '화이트',
              rightPitcher: '김윤하',
              ticketUrl: 'https://nol.interpark.com/ticket',
            ),
            TodayGameCard(
              leftPhotoUrl: '',
              rightPhotoUrl: '',
              gameState: '경기종료',
              stadium: '고척',
              gameTime: TimeOfDay(hour: 18, minute: 20),
              broadcastInfo: 'SPO-2T',
              leftPitcher: '화이트',
              rightPitcher: '김윤하',
              ticketUrl: 'https://nol.interpark.com/ticket',
            ),
            TodayGameCard(
              leftPhotoUrl: '',
              rightPhotoUrl: '',
              gameState: '경기예정',
              stadium: '고척',
              gameTime: TimeOfDay(hour: 18, minute: 20),
              broadcastInfo: 'SPO-2T',
              leftPitcher: '화이트',
              rightPitcher: '김윤하',
              ticketUrl: 'https://nol.interpark.com/ticket',
            ),
            TodayGameCard(
              leftPhotoUrl: '',
              rightPhotoUrl: '',
              gameState: '경기예정',
              stadium: '고척',
              gameTime: TimeOfDay(hour: 18, minute: 20),
              broadcastInfo: 'SPO-2T',
              leftPitcher: '화이트',
              rightPitcher: '김윤하',
              ticketUrl: 'https://nol.interpark.com/ticket',
            ),
            TodayGameCard(
              leftPhotoUrl: '',
              rightPhotoUrl: '',
              gameState: '경기예정',
              stadium: '고척',
              gameTime: TimeOfDay(hour: 18, minute: 20),
              broadcastInfo: 'SPO-2T',
              leftPitcher: '화이트',
              rightPitcher: '김윤하',
              ticketUrl: 'https://nol.interpark.com/ticket',
            ),
            TodayGameCard(
              leftPhotoUrl: '',
              rightPhotoUrl: '',
              gameState: '경기예정',
              stadium: '고척',
              gameTime: TimeOfDay(hour: 18, minute: 20),
              broadcastInfo: 'SPO-2T',
              leftPitcher: '화이트',
              rightPitcher: '김윤하',
              ticketUrl: 'https://nol.interpark.com/ticket',
            ),
            TodayGameCard(
              leftPhotoUrl: '',
              rightPhotoUrl: '',
              gameState: '경기예정',
              stadium: '고척',
              gameTime: TimeOfDay(hour: 18, minute: 20),
              broadcastInfo: 'SPO-2T',
              leftPitcher: '화이트',
              rightPitcher: '김윤하',
              ticketUrl: 'https://nol.interpark.com/ticket',
            ),
            TodayGameCard(
              leftPhotoUrl: '',
              rightPhotoUrl: '',
              gameState: '경기예정',
              stadium: '고척',
              gameTime: TimeOfDay(hour: 18, minute: 20),
              broadcastInfo: 'SPO-2T',
              leftPitcher: '화이트',
              rightPitcher: '김윤하',
              ticketUrl: 'https://nol.interpark.com/ticket',
            ),
          ],
        ),
      ],
    );
  }
}
