import 'package:ballkkaye_frontend/_core/utils/m_util.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_vm.dart'; // UserPredictionGame을 위한 import
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_card.dart';
import 'package:flutter/material.dart';

class UserPredictionCardList extends StatelessWidget {
  final List<UserPredictionGame> games;
  final void Function(int gameId, int teamId)? onSelectTeam;

  const UserPredictionCardList({
    super.key,
    required this.games,
    this.onSelectTeam,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: games.map((g) {
        final game = g.game;
        final home = game.homeTeam;
        final away = game.awayTeam;
        final time = parseHourMinute(g.game.gameTime);

        final VoidCallback? currentOnTapLeft =
            onSelectTeam != null ? () => onSelectTeam!(game.id!, home.teamId!) : null;
        final VoidCallback? currentOnTapRight =
            onSelectTeam != null ? () => onSelectTeam!(game.id!, away.teamId!) : null;

        return Column(
          children: [
            UserPredictionCard(
              gameId: game.id,
              leftTeamId: away.teamId!,
              rightTeamId: home.teamId!,
              selectedTeamId: g.userChoiceTeamId,
              leftTeamName: away.teamName!,
              rightTeamName: home.teamName!,
              leftScore: away.score ?? 0,
              rightScore: home.score ?? 0,
              leftPercent: g.awayVoteRate,
              rightPercent: g.homeVoteRate,
              startHour: time['hour']!,
              startMinute: time['minute']!,
              predictionStatus: g.predictionStatus,
              gameStatus: g.game.gameStatus,
              onTapLeft: currentOnTapLeft,
              onTapRight: currentOnTapRight,
              leftTeamLogo: away.teamLogo ?? '',
              rightTeamLogo: home.teamLogo ?? '',
            ),
            SizedBox(height: 10),
          ],
        );
      }).toList(),
    );
  }
}
