import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/prediction_page/widget/prediction_card.dart';
import 'package:flutter/material.dart';

class PredictionBody extends StatelessWidget {
  const PredictionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              children: [
                // 카드
                PredictionCard(),
                PredictionCard(),
                PredictionCard(),
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
