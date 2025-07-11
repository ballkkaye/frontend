import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/rainout_prdiction_weather_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_rain_value.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_report.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_weather_head.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_weather_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RainoutPredictionCard extends ConsumerWidget {
  final int? stadiumId;

  const RainoutPredictionCard({
    super.key,
    required this.stadiumId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // stadiumId가 null이면 기본값 사용 (예: 잠실야구장 id = 1)
    final effectiveStadiumId = stadiumId ?? 1;

    final weatherModel = ref.watch(
      rainoutPredictionWeatherProvider(effectiveStadiumId),
    );

    if (weatherModel == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 22, horizontal: 12),
      decoration: BoxDecoration(
        boxShadow: MColor.kShadow.normal,
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          RainoutPredictionWeatherHead(weatherModel: weatherModel),
          SizedBox(height: 20),
          RainoutPredictionWeatherList(weatherModel: weatherModel),
          SizedBox(height: 20),
          RainoutPredictionRainValue(weatherModel: weatherModel),
          SizedBox(height: 20),
          RainoutPredictionReport(weatherModel: weatherModel),
        ],
      ),
    );
  }
}
