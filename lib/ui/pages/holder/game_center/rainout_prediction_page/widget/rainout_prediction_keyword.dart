import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:flutter/material.dart';

class RainoutPredictionKeyword extends StatelessWidget {
  const RainoutPredictionKeyword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MIcon.page.rainout.bSunny,
        SizedBox(height: 6),
        Text(
          '맑음',
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
