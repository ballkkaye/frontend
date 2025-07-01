import 'package:ballkkaye_frontend/_core/style/m_color.dart';
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
        Text(
          leftPitcher,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: MColor.kLabel.normal,
          ),
        ),
        SizedBox(width: 20),
        Text(
          rightPitcher,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: MColor.kLabel.normal,
          ),
        ),
      ],
    );
  }
}
