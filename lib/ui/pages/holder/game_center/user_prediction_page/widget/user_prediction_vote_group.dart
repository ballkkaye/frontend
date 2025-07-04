import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_graph_group.dart';
import 'package:flutter/material.dart';

class UserPredictionVoteGroup extends StatelessWidget {
  final double leftPercent;
  final double rightPercent;

  const UserPredictionVoteGroup({
    super.key,
    required this.leftPercent,
    required this.rightPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: MColor.kLine.normal, width: 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MText.normal7_600(
                  '볼까예 투표율',
                  color: MColor.kLabel.normal,
                ),
                SizedBox(width: 8),
                MIcon.page.userPrediction.arrow,
              ],
            ),
            SizedBox(width: 12),
            UserPredictionGraphGroup(
              leftPercent: leftPercent,
              rightPercent: rightPercent,
            ),
          ],
        ),
      ),
    );
  }
}
