import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_humidity.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_keyword.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_wind.dart';
import 'package:flutter/material.dart';

class RainoutPredictionWeatherList extends StatelessWidget {
  const RainoutPredictionWeatherList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RainoutPredictionKeyword(),
        RainoutPredictionHumidity(),
        RainoutPredictionWind(),
      ],
    );
  }
}
