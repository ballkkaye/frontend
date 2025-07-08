import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/rainout_prdiction_weather_vm.dart';
import 'package:flutter/material.dart';

class RainoutPredictionWeatherHead extends StatelessWidget {
  final RainoutPredictionWeatherModel weatherModel;
  const RainoutPredictionWeatherHead({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    final nowHour = DateTime.now().hour;
    final currentWeather =
        weatherModel.hourly.where((e) => e.hour == nowHour).isNotEmpty ? weatherModel.hourly.firstWhere((e) => e.hour == nowHour) : null;

    return Column(
      children: [
        MText.normal6_5(
          weatherModel.location,
          color: MColor.kLabel.normal,
        ),
        SizedBox(height: 4),
        MText.normal1_7(
          currentWeather != null ? '${currentWeather.temperature}°' : '기온 정보 없음',
          color: MColor.kLabel.normal,
        ),
        SizedBox(height: 4),
        MText.normal6_4(
          currentWeather != null ? '${currentWeather.temperatureDiffFromYesterday}°' : '기온 정보 없음',
          color: MColor.kLabel.normal,
        ),
      ],
    );
  }
}
