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
    final bool isTie = leftPercent == rightPercent;
    final bool isLeftHigher = !isTie && (leftPercent > rightPercent);
    final bool isRightHigher = !isTie && (rightPercent > leftPercent);

    double total = leftPercent + rightPercent;
    double barPercent;

    if (total == 0) {
      barPercent = 0.0;
    } else {
      barPercent = (isLeftHigher || isTie) ? leftPercent / total : rightPercent / total;
    }

    return Row(
      children: [
        // Left Text
        Text(
          '${leftPercent.toInt()}%',
          style: TextStyle(
            fontSize: 12,
            fontWeight: (isTie || isLeftHigher) ? FontWeight.w600 : FontWeight.w400,
            color: (isTie || isLeftHigher) ? MColor.kLabel.normal : MColor.kLabel.alternative,
          ),
        ),
        const SizedBox(width: 8),
        // Bar
        UserPredictionGraph(isLeftHigher: isLeftHigher, barPercent: barPercent),
        const SizedBox(width: 8),
        // Right Text
        Text(
          '${rightPercent.toInt()}%',
          style: TextStyle(
            fontSize: 12,
            fontWeight: (isTie || isRightHigher) ? FontWeight.w600 : FontWeight.w400,
            color: (isTie || isRightHigher) ? MColor.kLabel.normal : MColor.kLabel.alternative,
          ),
        ),
      ],
    );
  }
}
