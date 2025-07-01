import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:flutter/material.dart';

class RainoutPredictionHumidity extends StatelessWidget {
  const RainoutPredictionHumidity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MIcon.page.rainout.bHumidity,
        SizedBox(height: 6),
        Text(
          '습도 73%',
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
