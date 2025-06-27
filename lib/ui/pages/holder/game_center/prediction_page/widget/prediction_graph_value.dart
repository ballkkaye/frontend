import 'package:ballkkaye_frontend/ui/pages/holder/game_center/prediction_page/widget/prediction_praph_value_state.dart';
import 'package:flutter/material.dart';

class PredictionGraphValue extends StatefulWidget {
  final double leftScore;
  final double rightScore;

  const PredictionGraphValue({
    super.key,
    required this.leftScore,
    required this.rightScore,
  });

  @override
  State<PredictionGraphValue> createState() => PredictionGraphValueState();
}
