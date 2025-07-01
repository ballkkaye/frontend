import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_report_label.dart';
import 'package:flutter/material.dart';

class RainoutPredictionReport extends StatelessWidget {
  const RainoutPredictionReport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '우천취소 예측 리포트',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: MColor.kLabel.normal,
          ),
        ),
        SizedBox(height: 10),
        RainoutPredictionReportLabel(),
      ],
    );
  }
}
