import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class RainoutPredictionWeatherHead extends StatelessWidget {
  const RainoutPredictionWeatherHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '부산광역시 사직동',
          style: TextStyle(
            color: MColor.kLabel.normal,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '13˚',
          style: TextStyle(
            color: MColor.kLabel.normal,
            fontSize: 38,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '어제보다 0.9˚↑',
          style: TextStyle(
            color: MColor.kLabel.normal,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
