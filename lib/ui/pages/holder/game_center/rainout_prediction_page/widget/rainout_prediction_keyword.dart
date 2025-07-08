import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class RainoutPredictionKeyword extends StatelessWidget {
  final String weatherCode;
  const RainoutPredictionKeyword({super.key, required this.weatherCode});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MIcon.page.rainout.bSunny, // TODO: 날씨에따라 아이콘 바꾸기
        SizedBox(height: 6),
        MText.normal6_5(
          weatherCode,
          color: MColor.kLabel.normal,
        ),
      ],
    );
  }
}
