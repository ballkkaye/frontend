import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class TodayGamePitchers extends StatelessWidget {
  final String leftPitcher;
  final String rightPitcher;

  const TodayGamePitchers({
    super.key,
    required this.leftPitcher,
    required this.rightPitcher,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MText.normal5_5(
          leftPitcher,
          color: MColor.kLabel.normal,
        ),
        SizedBox(width: 20),
        MText.normal5_5(
          rightPitcher,
          color: MColor.kLabel.normal,
        ),
      ],
    );
  }
}
