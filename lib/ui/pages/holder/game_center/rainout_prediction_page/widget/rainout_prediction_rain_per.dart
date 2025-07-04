import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_rain_per_box.dart';
import 'package:flutter/material.dart';

class RainoutPredictionRainPer extends StatelessWidget {
  const RainoutPredictionRainPer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MText.normal8_400(
          '확률 %',
          color: MColor.kLabel.normal,
        ),
        SizedBox(
          height: 25,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(24, (index) {
                return Row(
                  children: [
                    RainoutPredictionRainPerBox(value: index == 3 ? 60 : 0),
                    if (index != 23) const SizedBox(width: 2),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
