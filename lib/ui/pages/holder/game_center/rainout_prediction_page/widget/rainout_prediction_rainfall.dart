import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_rainfall_box.dart';
import 'package:flutter/material.dart';

class RainoutPredictionRainfall extends StatelessWidget {
  const RainoutPredictionRainfall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '강수량 mm',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: MColor.kLabel.normal,
          ),
        ),
        SizedBox(
          height: 50,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(24, (index) {
                return Row(
                  children: [
                    RainoutPredictionRainfallBox(
                      value: index == 3 ? 1 : 0,
                      hour: index.toString().padLeft(2, '0'),
                    ),
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
