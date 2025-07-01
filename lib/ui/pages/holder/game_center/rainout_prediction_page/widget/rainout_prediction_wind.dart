import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
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
        Text(
          '남서풍 0.4m/s',
          style: TextStyle(
            color: MColor.kLabel.normal,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
