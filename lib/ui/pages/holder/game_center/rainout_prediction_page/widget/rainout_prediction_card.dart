import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_rain_value.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_report.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_weather_head.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_weather_list.dart';
import 'package:flutter/material.dart';

class RainoutPredictionCard extends StatelessWidget {
  const RainoutPredictionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 22, horizontal: 12),
      decoration: BoxDecoration(
        boxShadow: MColor.kShadow.normal,
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          RainoutPredictionWeatherHead(),
          SizedBox(height: 20),
          RainoutPredictionWeatherList(),
          SizedBox(height: 20),
          RainoutPredictionRainValue(),
          SizedBox(height: 20),
          RainoutPredictionReport(),
        ],
      ),
    );
  }
}
