import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/prediction_page/prediction_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/prediction_page/widget/prediction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PredictionBody extends ConsumerWidget {
  const PredictionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(predictionProvider);

    if (model == null) {
      return Center(child: MText.normal3_6("오늘의 경기가 없습니다.", color: MColor.kLabel.disable));
    } else {
      return ListView(children: [
        Padding(
          padding: EdgeInsets.only(
            top: 22,
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MText.h2(
                '오늘 승리 예측',
                color: MColor.kLabel.normal,
              ),
              SizedBox(height: 12),
              Column(
                children: model.games.map((game) {
                  return PredictionCard(predictionGame: game); // game 넘기기
                }).toList(),
              ),
            ],
          ),
        ),
      ]);
    }
  }
}
