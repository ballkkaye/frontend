import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
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
        MText.normal6_600(title, color: MColor.kLabel.normal),
        if (showTotalLabel && totalScore != null && totalScoreValue != null)
          Row(
            children: [
              MText.normal6_400(totalScore!, color: MColor.kLabel.normal),
              SizedBox(width: 4),
              MText.normal6_700(totalScoreValue!.toStringAsFixed(1), color: MColor.kLabel.normal),
            ],
          ),
      ],
    );
  }
}
