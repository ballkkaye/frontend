import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class UserPredictionGraph extends StatelessWidget {
  const UserPredictionGraph({
    super.key,
    required this.isLeftHigher,
    required this.barPercent,
  });

  final bool isLeftHigher;
  final double barPercent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      child: Stack(
        children: [
          Container(
            height: 16,
            decoration: BoxDecoration(
              color: MColor.kFill.normal,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Align(
            alignment:
                isLeftHigher ? Alignment.centerLeft : Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: barPercent,
              child: Container(
                height: 16,
                decoration: BoxDecoration(
                  color: MColor.kPrimary.alternative,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
