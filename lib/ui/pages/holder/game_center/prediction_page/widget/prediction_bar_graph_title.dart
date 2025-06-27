import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class PredictionGraphTitle extends StatelessWidget {
  final String title;
  final String? totalScore;
  final double? totalScoreValue;
  final bool showTotalLabel;

  const PredictionGraphTitle({
    super.key,
    required this.title,
    this.totalScore,
    this.totalScoreValue,
    this.showTotalLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: MColor.kLabel.normal,
          ),
        ),
        if (showTotalLabel && totalScore != null && totalScoreValue != null)
          Row(
            children: [
              Text(
                totalScore!,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: MColor.kLabel.normal,
                ),
              ),
              SizedBox(width: 4),
              Text(
                totalScoreValue!.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: MColor.kLabel.normal,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
