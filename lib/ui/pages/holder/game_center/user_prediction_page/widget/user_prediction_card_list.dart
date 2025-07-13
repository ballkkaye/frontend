import 'package:ballkkaye_frontend/_core/utils/m_util.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_card.dart';
import 'package:flutter/material.dart';

class UserPredictionCardList extends StatelessWidget {
  final List<UserPredictionGame> games;
  final void Function(int gameId, int teamId) onSelectTeam;

  const UserPredictionCardList({
    super.key,
    required this.games,
    required this.onSelectTeam,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: games.map((g) {
        // 예측 카드 위젯 생성
        final game = g.game;
        final home = game.homeTeam;
        final away = game.awayTeam;
        final time = parseHourMinute(g.game.gameTime);
        return Column(
          children: [
            UserPredictionCard(
              gameId: game.id,
              leftTeamId: home.teamId!,
              rightTeamId: away.teamId!,
              selectedTeamId: g.userChoiceTeamId,


              leftTeamName: home.teamName!,
              rightTeamName: away.teamName!,
              leftScore: home.score ?? 0,
              rightScore: away.score ?? 0,
              leftPercent: g.homeVoteRate,
              rightPercent: g.awayVoteRate,
              startHour: time['hour']!,
              startMinute: time['minute']!,
              predictionStatus: g.predictionStatus,
              gameStatus: g.game.gameStatus,
              onTapLeft: () => onSelectTeam(game.id!, home.teamId!),
              onTapRight: () => onSelectTeam(game.id!, away.teamId!),
            ),
          ],
        );
      }).toList(),
    );
  }
}
