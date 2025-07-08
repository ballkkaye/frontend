import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/rainout_prdiction_weather_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_report_label.dart';
import 'package:flutter/material.dart';

class RainoutPredictionReport extends StatelessWidget {
  final RainoutPredictionWeatherModel weatherModel;
  const RainoutPredictionReport({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MText.normal5_6(
          '우천취소 예측 리포트',
          color: MColor.kLabel.normal,
        ),
        SizedBox(height: 10),
        RainoutPredictionReportLabel(
          message: weatherModel.message,
        ),
      ],
    );
  }
}
