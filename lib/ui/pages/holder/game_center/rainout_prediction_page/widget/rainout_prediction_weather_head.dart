import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class RainoutPredictionWeatherHead extends StatelessWidget {
  const RainoutPredictionWeatherHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MText.normal6_500(
          '부산광역시 사직동',
          color: MColor.kLabel.normal,
        ),
        SizedBox(height: 4),
        MText.normal1_700(
          '13˚',
          color: MColor.kLabel.normal,
        ),
        SizedBox(height: 4),
        MText.normal6_400(
          '어제보다 0.9˚↑',
          color: MColor.kLabel.normal,
        ),
      ],
    );
  }
}
