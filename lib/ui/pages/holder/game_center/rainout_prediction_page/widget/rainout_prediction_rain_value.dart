import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/rainout_prdiction_weather_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_rain_per.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_rainfall.dart';
import 'package:flutter/material.dart';

class RainoutPredictionRainValue extends StatelessWidget {
  final RainoutPredictionWeatherModel weatherModel;
  const RainoutPredictionRainValue({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    final nowHour = DateTime.now().hour;
    final rainData =
        weatherModel.hourlyRain.where((e) => e.hour == nowHour).isNotEmpty ? weatherModel.hourlyRain.firstWhere((e) => e.hour == nowHour) : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MText.normal5_6(
          '강수',
          color: MColor.kLabel.normal,
        ),
        SizedBox(height: 8),
        Column(
          children: [
            RainoutPredictionRainPer(
              rainPer: rainData?.rainPer ?? 0.0,
            ),
            SizedBox(height: 8),
            RainoutPredictionRainfall(
              rainAmount: rainData?.rainAmount ?? 0.0,
              hour: rainData?.hour ?? 0,
            ),
          ],
        ),
      ],
    );
  }
}
