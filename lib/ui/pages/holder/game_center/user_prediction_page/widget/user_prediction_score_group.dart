import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_left_team.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_right_team.dart';
import 'package:flutter/material.dart';

class UserPredictionScoreGroup extends StatelessWidget {
  const UserPredictionScoreGroup({
    super.key,
    required this.leftTeamName,
    required this.leftScore,
    required this.rightTeamName,
    required this.rightScore,
    required this.isLeftSelected,
    required this.isRightSelected,
    required this.onTapLeft,
    required this.onTapRight,
  });

  final String leftTeamName;
  final int leftScore;
  final String rightTeamName;
  final int rightScore;
  final bool isLeftSelected;
  final bool isRightSelected;
  final VoidCallback onTapLeft;
  final VoidCallback onTapRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UserPredictionLeftTeam(
          teamName: leftTeamName,
          score: leftScore,
          isSelected: isLeftSelected,
          onTap: onTapLeft,
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
          isSelected: isRightSelected,
          onTap: onTapRight,
        ),
      ],
    );
  }
}
