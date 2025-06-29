import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_left_team.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_right_team.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_vote_group.dart';
import 'package:flutter/material.dart';

class UserPredictionCard extends StatelessWidget {
  final String leftTeamName;
  final String rightTeamName;
  final int leftScore;
  final int rightScore;
  final double leftPercent;
  final double rightPercent;

  const UserPredictionCard({
    super.key,
    required this.leftTeamName,
    required this.rightTeamName,
    required this.leftScore,
    required this.rightScore,
    required this.leftPercent,
    required this.rightPercent,
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
              Row(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  UserPredictionLeftTeam(
                    teamName: leftTeamName,
                    score: leftScore,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.5),
                    child: Center(
                      //TODO 예측 결과에 따라 success 혹은 fail 아이콘으로 변경될 수 있도록
                      child: MIcon.page.userPrediction.success,
                    ),
                  ),
                  UserPredictionRightTeam(
                    teamName: rightTeamName,
                    score: rightScore,
                  ),
                ],
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
