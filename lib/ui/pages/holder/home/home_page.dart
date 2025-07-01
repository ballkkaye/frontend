import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/prediction_page/prediction_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/prediction_page/widget/prediction_bar_graph_title.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/prediction_page/widget/prediction_graph_value.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/prediction_page/widget/prediction_player_image.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/today_game_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/widget/today_game_card_content.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/widget/today_game_ticket_btn.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_prediction_slider.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_today_game_slider.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/mypage_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/images/main_logo.png',
          height: 40,
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MypagePage()),
              );
            },
            child: ClipOval(
              child: Container(
                width: 30,
                height: 30,
                color: Colors.grey.shade300,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 21,
                    height: 21,
                    child: MIcon.page.mypage.userDummy,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MText.h3_6('오늘의 경기', color: MColor.kLabel.normal),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => TodayGamePage()),
                        );
                      },
                      child: Container(
                        width: 44,
                        height: 22,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: MColor.kPrimary.strong),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        alignment: Alignment.center,
                        child: MText.button5_6(
                          '더보기',
                          color: MColor.kPrimary.strong,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14),
              HomeTodatGameSlider(),
            ],
          ),
          SizedBox(height: 56),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MText.h3_6('승리예측', color: MColor.kLabel.normal),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => PredictionPage()),
                        );
                      },
                      child: Container(
                        width: 44,
                        height: 22,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: MColor.kPrimary.strong),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        alignment: Alignment.center,
                        child: MText.button5_6(
                          '더보기',
                          color: MColor.kPrimary.strong,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14),
              HomePredictionSlider(),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/board/list");
        },
      ),
    );
  }
}

class HomeTodayGameCard extends StatelessWidget {
  final String? leftPhotoUrl;
  final String? rightPhotoUrl;
  final String gameState;
  final String stadium;
  final TimeOfDay gameTime;
  final String broadcastInfo;
  final String leftPitcher;
  final String rightPitcher;
  final String ticketUrl;

  const HomeTodayGameCard({
    super.key,
    this.leftPhotoUrl,
    this.rightPhotoUrl,
    required this.gameState,
    required this.stadium,
    required this.gameTime,
    required this.broadcastInfo,
    required this.leftPitcher,
    required this.rightPitcher,
    required this.ticketUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: MColor.kShadow.normal,
        color: Colors.white,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TodayGameCardContent(
            rightPhotoUrl: rightPhotoUrl,
            leftPhotoUrl: leftPhotoUrl,
            gameState: gameState,
            stadium: stadium,
            gameTime: gameTime,
            broadcastInfo: broadcastInfo,
            leftPitcher: leftPitcher,
            rightPitcher: leftPitcher,
          ),
          TodayGameTicketBtn(ticketUrl: ticketUrl),
        ],
      ),
    );
  }
}

class HomePredictionCard extends StatelessWidget {
  const HomePredictionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: MColor.kBackground.normal,
            borderRadius: BorderRadius.circular(8),
            boxShadow: MColor.kShadow.normal,
          ),
          child: Column(
            children: [
              // 선수프로필, 상대전적확인버튼
              Row(
                children: [
                  Expanded(
                    // 윗영역
                    child: Column(
                      children: [
                        // 팀명라벨, 선수명
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // 팀명 라벨
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: MColor.kPrimary.strong,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 2,
                                ),
                                child: MText.label2_7(
                                  '팀명',
                                  color: MColor.kLabel.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 2),
                            // 선수명
                            Text(
                              '선수명',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: MColor.kLabel.normal,
                              ),
                            ),
                          ],
                        ),
                        // 여백
                        SizedBox(height: 4),
                        // 선수 프로필사진
                        Row(
                          children: [
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 5 / 7,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: MColor.kFill.normal,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  // TODO: 나중에 통신 연결 시 null자리에 imageUrl
                                  child: PredictionPlayerImage(null),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // 여백
                        SizedBox(height: 10),
                        // 버튼
                        AspectRatio(
                          aspectRatio: 131 / 34,
                          child: SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/game-center/matchup');
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                foregroundColor: MColor.kPrimary.normal,
                                side: BorderSide(color: MColor.kPrimary.strong),
                              ),
                              child: MText.button5_7(
                                '상대 전적 확인',
                                color: MColor.kPrimary.strong,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'VS',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: MColor.kLabel.neutral,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        // 팀명라벨, 선수명
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // 팀명 라벨
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: MColor.kPrimary.strong,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 2,
                                ),
                                child: MText.label2_7(
                                  '팀명',
                                  color: MColor.kLabel.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 2),
                            // 선수명
                            Text(
                              '선수명',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: MColor.kLabel.normal,
                              ),
                            ),
                          ],
                        ),
                        // 여백
                        SizedBox(height: 4),
                        // 선수 프로필사진
                        Row(
                          children: [
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 5 / 7,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: MColor.kFill.normal,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  // TODO: 나중에 통신 연결 시 null자리에 imageUrl
                                  child: PredictionPlayerImage(null),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // 여백
                        SizedBox(height: 10),
                        // 버튼
                        AspectRatio(
                          aspectRatio: 131 / 34,
                          child: SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/game-center/matchup');
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                foregroundColor: MColor.kPrimary.normal,
                                side: BorderSide(color: MColor.kPrimary.strong),
                              ),
                              child: MText.button5_7(
                                '상대 전적 확인',
                                color: MColor.kPrimary.strong,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14),
              // 예상득점, 승리확률
              Column(
                children: [
                  Column(
                    children: [
                      PredictionGraphTitle(
                        title: '예상득점',
                        showTotalLabel: true,
                        totalScore: '양팀 득점 합계',
                        totalScoreValue: 7.7,
                      ),
                      SizedBox(height: 6),
                      PredictionGraphValue(leftScore: 3.2, rightScore: 4.5),
                    ],
                  ),
                  SizedBox(height: 12),
                  Column(
                    children: [
                      PredictionGraphTitle(
                        title: '승리확률',
                        showTotalLabel: false,
                      ),
                      SizedBox(height: 6),
                      PredictionGraphValue(leftScore: 42.8, rightScore: 57.2),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 14),
      ],
    );
  }
}
