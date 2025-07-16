import 'package:ballkkaye_frontend/ui/pages/holder/game_center/prediction_page/prediction_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/home_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_heading.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_prediction_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePrediction extends ConsumerWidget {
  const HomePrediction({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeModel = ref.watch(homeProvider);
    if (homeModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      final predictions = homeModel.predictionModel.games;
      return Column(
        children: [
          HomeHeading(
            title: '승리 예측',
            uri: PredictionPage(),
          ),
          SizedBox(height: 14),
          HomePredictionSlider(games: predictions),
        ],
      );
    }
  }
}
