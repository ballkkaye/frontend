import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_graph.dart';
import 'package:flutter/material.dart';

class UserPredictionGraphGroup extends StatelessWidget {
  final double leftPercent;
  final double rightPercent;

  const UserPredictionGraphGroup({
    super.key,
    required this.leftPercent,
    required this.rightPercent,
  });

  @override
  Widget build(BuildContext context) {
    bool isLeftHigher = leftPercent >= rightPercent;
    double total = leftPercent + rightPercent;
    double barPercent = (isLeftHigher ? leftPercent : rightPercent) / total;

    return Row(
      children: [
        // Left Text
        Text(
          '${leftPercent.toInt()}%',
          style: TextStyle(
            fontSize: 12,
            fontWeight: isLeftHigher ? FontWeight.w600 : FontWeight.w400,
            color:
                isLeftHigher ? MColor.kLabel.normal : MColor.kLabel.alternative,
          ),
        ),
        SizedBox(width: 8),
        // Bar
        UserPredictionGraph(isLeftHigher: isLeftHigher, barPercent: barPercent),
        SizedBox(width: 8),
        // Right Text
        Text(
          '${rightPercent.toInt()}%',
          style: TextStyle(
            fontSize: 12,
            fontWeight: isLeftHigher ? FontWeight.w400 : FontWeight.w600,
            color:
                isLeftHigher ? MColor.kLabel.alternative : MColor.kLabel.normal,
          ),
        ),
      ],
    );
  }
}
