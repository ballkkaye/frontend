import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/widget/game_center_card.dart';
import 'package:flutter/material.dart';

class GameCenterBody extends StatelessWidget {
  const GameCenterBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 22,
        horizontal: 16,
      ),
      child: Column(
        children: [
          GameCenterCard(
              title: '오늘의 경기',
              description: '오늘의 경기를 확인해보세요',
              icon: MIcon.page.predictionList.todayGame,
              onTap: () {
                Navigator.pushNamed(context, '/game_center/today_game');
              }),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: GameCenterCard(
                    title: '승리예측',
                    description: '볼까예의 예측을\n확인해 보세요',
                    icon: MIcon.page.predictionList.prediction,
                    onTap: () {
                      Navigator.pushNamed(context, '/game_center/today_game');
                    }),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 6,
                child: GameCenterCard(
                    title: '우천취소 예측',
                    description: '',
                    icon: MIcon.page.predictionList.rain,
                    onTap: () {
                      Navigator.pushNamed(context, '/game_center/rainout_prediction');
                    }),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 6,
                child: GameCenterCard(
                    title: '나의 승부 예측',
                    description: '오늘 경기의 승리를\n예측해 보세요',
                    icon: MIcon.page.predictionList.userPrediction,
                    onTap: () {
                      Navigator.pushNamed(context, '/game_center/user_prediction');
                    }),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 4,
                child: GameCenterCard(
                    title: '팀 순위',
                    description: '실시간 팀 순위를\n확인해 보세요',
                    icon: MIcon.page.predictionList.ranking,
                    onTap: () {
                      Navigator.pushNamed(context, '/game_center/ranking');
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
