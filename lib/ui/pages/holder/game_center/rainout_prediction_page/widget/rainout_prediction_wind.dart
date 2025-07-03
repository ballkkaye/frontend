import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class RainoutPredictionWind extends StatelessWidget {
  const RainoutPredictionWind({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MIcon.page.rainout.bWind,
        SizedBox(height: 6),
        MText.normal6_500(
          '남서풍 0.4m/s',
          color: MColor.kLabel.normal,
        ),
      ],
    );
  }
}
