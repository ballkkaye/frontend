import 'package:ballkkaye_frontend/_core/utils/m_util.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_fm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class UserPredictionCardList extends ConsumerWidget {
  final List<UserPredictionGame> games;
  final void Function(int gameId, int teamId)? onSelectTeam;
  final bool isResult;

  UserPredictionCardList({
    super.key,
    required this.games,
    this.onSelectTeam,
    this.isResult = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Logger().d("📍[UserPredictionCardList] isResult: $isResult");

    // 예측 후라면 상태 안 씀, 예측 전이면 상태에서 선택된 팀 확인
    List<UserPredictionFModel> predictions =
        isResult ? [] : ref.watch(userPredictionFProvider);

    return Column(
      children: games.map((g) {
        final game = g.game;
        final home = game.homeTeam;
        final away = game.awayTeam;

        final time = parseHourMinute(game.gameTime);

        // 선택된 팀 ID 결정
        final selected = isResult
            ? g.userChoiceTeamId
            : predictions
                .firstWhere(
                  (e) => e.gameId == game.id,
                  orElse: () => UserPredictionFModel(
                      gameId: game.id!, userChoiceTeamId: -1),
                )
                .userChoiceTeamId;

        Logger().d(
            "📌 gameId: ${game.id}, selectedTeamId: $selected, home: ${home.teamId}, away: ${away.teamId}");

        return UserPredictionCard(
          gameId: game.id,
          leftTeamId: home.teamId!,
          rightTeamId: away.teamId!,
          selectedTeamId: selected! > 0 ? selected : -1,
          leftTeamName: home.teamName!,
          rightTeamName: away.teamName!,
          leftScore: home.score ?? 0,
          rightScore: away.score ?? 0,
          leftPercent: g.homeVoteRate,
          rightPercent: g.awayVoteRate,
          startHour: time['hour']!,
          startMinute: time['minute']!,
          predictionStatus: g.predictionStatus,
          gameStatus: game.gameStatus,
          teamLogo: home.teamLogo ?? '',

          // ✅ 결과 화면이면 터치 비활성화
          onTapLeft: isResult
              ? null
              : () {
                  Logger().d(
                      "👉 LEFT CLICKED: gameId=${game.id}, teamId=${home.teamId}");
                  onSelectTeam?.call(game.id!, home.teamId!);
                },
          onTapRight: isResult
              ? null
              : () {
                  Logger().d(
                      "👉 RIGHT CLICKED: gameId=${game.id}, teamId=${away.teamId}");
                  onSelectTeam?.call(game.id!, away.teamId!);
                },
        );
      }).toList(),
    );
  }
}
