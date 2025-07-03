import 'package:ballkkaye_frontend/ui/pages/holder/game_center/prediction_page/prediction_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_heading.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_prediction_slider.dart';
import 'package:flutter/material.dart';

class HomePrediction extends StatelessWidget {
  const HomePrediction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeHeading(
          title: '승리예측',
          uri: PredictionPage(),
        ),
        SizedBox(height: 14),
        HomePredictionSlider(),
      ],
    );
  }
}
