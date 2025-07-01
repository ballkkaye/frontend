import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_card.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/widget/rainout_prediction_stadium_dropdown.dart';
import 'package:flutter/material.dart';

class RainoutPredictionBody extends StatelessWidget {
  const RainoutPredictionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MText.h2('현재 날씨'),
                RainoutPredictionStadiumDropdown(),
              ],
            ),
            SizedBox(height: 12),
            RainoutPredictionCard(),
          ],
        ),
      ),
    );
  }
}
