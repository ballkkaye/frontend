import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_score_group.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_time_group.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_vote_group.dart';
import 'package:flutter/material.dart';

class UserPredictionCard extends StatelessWidget {
  final String leftTeamName;
  final String rightTeamName;
  final int leftScore;
  final int rightScore;
  final double leftPercent;
  final double rightPercent;
  final int startHour;
  final int startMinute;

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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: MColor.kLine.normal,
            ),
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
              ),
              UserPredictionVoteGroup(
                leftPercent: leftPercent,
                rightPercent: rightPercent,
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
