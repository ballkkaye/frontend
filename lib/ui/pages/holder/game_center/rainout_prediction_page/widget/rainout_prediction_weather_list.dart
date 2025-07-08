import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/rainout_prdiction_weather_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_humidity.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_keyword.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_wind.dart';
import 'package:flutter/material.dart';

class RainoutPredictionWeatherList extends StatelessWidget {
  final RainoutPredictionWeatherModel weatherModel;
  const RainoutPredictionWeatherList({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    final nowHour = DateTime.now().hour;
    final currentWeather =
        weatherModel.hourly.where((e) => e.hour == nowHour).isNotEmpty ? weatherModel.hourly.firstWhere((e) => e.hour == nowHour) : null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RainoutPredictionKeyword(
          weatherCode: currentWeather?.weatherCode ?? '정보 없음',
        ),
        RainoutPredictionHumidity(
          humidity: currentWeather?.humidity ?? 0,
        ),
        RainoutPredictionWind(
          windDirection: currentWeather?.windDirection ?? '—',
          windSpeed: currentWeather?.windSpeed ?? 0.0,
        ),
      ],
    );
  }
}
