import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/data/enum/game_status.dart';
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
    this.predictionStatus,
    required this.gameStatus,


  });

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

  @override
  Widget build(BuildContext context) {
    final bool showResult = gameStatus == GameStatus.completed;

    String? winStatus;
    if (showResult) {
      if (leftScore > rightScore) {
        winStatus = "LEFT_WIN";
      } else if (rightScore > leftScore) {
        winStatus = "RIGHT_WIN";
      } else {
        winStatus = "TIE";
      }
    }

    Widget resultIcon = const SizedBox.shrink();
    if (showResult) {
      if (predictionStatus == "CORRECT") {
        resultIcon = MIcon.page.userPrediction.success;
      } else if (predictionStatus == "INCORRECT") {
        resultIcon = MIcon.page.userPrediction.fail;
      }
    }

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
          padding: const EdgeInsets.symmetric(horizontal: 12.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              resultIcon, // ✅ 예측 결과 아이콘
              const SizedBox(height: 4),
              if (winStatus != null)
                Text(
                  winStatus == "TIE"
                      ? "무승부"
                      : winStatus == "LEFT_WIN"
                      ? "승"
                      : "패",
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
            ],
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
