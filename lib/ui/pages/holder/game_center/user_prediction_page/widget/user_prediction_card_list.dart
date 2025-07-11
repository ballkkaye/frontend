import 'package:ballkkaye_frontend/_core/utils/m_time.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_card.dart';
import 'package:flutter/material.dart';

class UserPredictionCardList extends StatelessWidget {
  final List<UserPredictionGame> games;

  const UserPredictionCardList({
    super.key,
    required this.games,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: games.map((g) {
        // 예측 카드 위젯 생성
        final time = parseHourMinute(g.game.gameTime);
        return Column(
          children: [
            UserPredictionCard(
              leftTeamName: g.game.homeTeam.teamName!,
              rightTeamName: g.game.awayTeam.teamName!,
              leftScore: g.game.homeTeam.score ?? 0,
              rightScore: g.game.awayTeam.score ?? 0,
              leftPercent: g.homeVoteRate,
              rightPercent: g.awayVoteRate,
              startHour: time['hour']!,
              startMinute: time['minute']!,
            ),
          ],
        );
      }).toList(),
    );
  }
}
