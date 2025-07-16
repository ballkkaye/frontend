import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/data/enum/game_status.dart';
// UserPredictionLeftTeam 및 UserPredictionRightTeam import 필요
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_left_team.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_right_team.dart'; // 이 파일도 존재한다고 가정
import 'package:flutter/material.dart';

class UserPredictionScoreGroup extends StatelessWidget {
  final String leftTeamName;
  final int leftScore;
  final String rightTeamName;
  final int rightScore;
  final bool isLeftSelected;
  final bool isRightSelected;
  final VoidCallback? onTapLeft;
  final VoidCallback? onTapRight;
  final String? predictionStatus;
  final GameStatus? gameStatus;
  final String leftTeamLogo;
  final String rightTeamLogo;

  const UserPredictionScoreGroup({
    super.key,
    required this.leftTeamName,
    required this.leftScore,
    required this.rightTeamName,
    required this.rightScore,
    required this.isLeftSelected,
    required this.isRightSelected,
    this.onTapLeft,
    this.onTapRight,
    required this.predictionStatus,
    required this.gameStatus,
    required this.leftTeamLogo,
    required this.rightTeamLogo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserPredictionLeftTeam(
          teamName: leftTeamName,
          score: leftScore,
          isSelected: isLeftSelected,
          onTap: onTapLeft,
          teamLogo: leftTeamLogo,
        ),
        Container(
          width: 1,
          height: 100,
          color: MColor.kLine.normal,
        ),
        UserPredictionRightTeam(
          teamName: rightTeamName,
          score: rightScore,
          isSelected: isRightSelected,
          onTap: onTapRight,
          teamLogo: rightTeamLogo,
        ),
      ],
    );
  }
}
