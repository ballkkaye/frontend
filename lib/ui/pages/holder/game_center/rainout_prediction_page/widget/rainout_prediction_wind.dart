import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class RainoutPredictionWind extends StatelessWidget {
  final String windDirection;
  final double windSpeed;
  const RainoutPredictionWind({
    super.key,
    required this.windDirection,
    required this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MIcon.page.rainout.bWind,
        SizedBox(height: 6),
        MText.normal6_5(
          '${windDirection} ${windSpeed}m/s',
          color: MColor.kLabel.normal,
        ),
      ],
    );
  }
}
