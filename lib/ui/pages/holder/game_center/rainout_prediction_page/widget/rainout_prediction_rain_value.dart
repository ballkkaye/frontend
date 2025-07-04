import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_rain_per.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_rainfall.dart';
import 'package:flutter/material.dart';

class RainoutPredictionRainValue extends StatelessWidget {
  const RainoutPredictionRainValue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MText.normal5_600(
          '강수',
          color: MColor.kLabel.normal,
        ),
        SizedBox(height: 8),
        Column(
          children: [
            RainoutPredictionRainPer(),
            SizedBox(height: 8),
            RainoutPredictionRainfall(),
          ],
        ),
      ],
    );
  }
}
