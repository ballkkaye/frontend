import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/data/enum/game_status.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_score_group.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_time_group.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_vote_group.dart';
import 'package:flutter/material.dart';

class UserPredictionCard extends StatelessWidget {
  final int? gameId;
  final int leftTeamId;
  final int rightTeamId;
  final int? selectedTeamId;

  final String leftTeamName;
  final String rightTeamName;
  final int leftScore;
  final int rightScore;
  final double leftPercent;
  final double rightPercent;
  final int startHour;
  final int startMinute;

  final VoidCallback? onTapLeft;
  final VoidCallback? onTapRight;
  final String? predictionStatus;
  final GameStatus? gameStatus;
  final String teamLogo;

  const UserPredictionCard({
    super.key,
    required this.leftTeamName,
    required this.rightTeamName,
    required this.leftScore,
    required this.rightScore,
    required this.leftPercent,
    required this.rightPercent,
    required this.startHour,
    required this.startMinute,
    required this.gameId,
    required this.leftTeamId,
    required this.rightTeamId,
    required this.selectedTeamId,
    required this.onTapLeft,
    required this.onTapRight,
    required this.predictionStatus,
    required this.gameStatus,
    required this.teamLogo,
  });

  @override
  Widget build(BuildContext context) {
    final bool canSelect = predictionStatus == null;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: MColor.kLine.normal),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              UserPredictionTimeGroup(
                hour: startHour,
                minute: startMinute,
              ),
              UserPredictionScoreGroup(
                leftTeamName: leftTeamName,
                leftScore: leftScore,
                rightTeamName: rightTeamName,
                rightScore: rightScore,
                isLeftSelected: selectedTeamId == leftTeamId,
                isRightSelected: selectedTeamId == rightTeamId,
                onTapLeft: canSelect ? onTapLeft : null,
                onTapRight: canSelect ? onTapRight : null,
                predictionStatus: predictionStatus,
                gameStatus: gameStatus,
                teamLogo: teamLogo,
              ),
              UserPredictionVoteGroup(
                leftPercent: leftPercent,
                rightPercent: rightPercent,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
