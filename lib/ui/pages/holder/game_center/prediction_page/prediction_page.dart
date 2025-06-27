import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/prediction_page/widget/prediction_body.dart';
import 'package:flutter/material.dart';

class PredictionPage extends StatelessWidget {
  const PredictionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: PredictionBody(),
    );
  }

  AppBar _appbar() {
    return AppBar(
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: MText.h1('승리예측'),
      ),
    );
  }
}
