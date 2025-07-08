import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class RainoutPredictionHumidity extends StatelessWidget {
  final double humidity;
  const RainoutPredictionHumidity({
    super.key,
    required this.humidity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MIcon.page.rainout.bHumidity,
        SizedBox(height: 6),
        MText.normal6_5(
          '습도 ${humidity}%',
          color: MColor.kLabel.normal,
        ),
      ],
    );
  }
}
