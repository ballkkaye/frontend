import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class RainoutPredictionRainPerBox extends StatelessWidget {
  final double rainPer;

  const RainoutPredictionRainPerBox({
    super.key,
    required this.rainPer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 24,
      color: rainPer == 0 ? MColor.kFill.normal : Color(0x664EE1BB),
      alignment: Alignment.center,
      child: MText.normal8_6(
        '${rainPer}%',
        color: rainPer == 0 ? MColor.kLabel.alternative : MColor.kLabel.normal,
      ),
    );
  }
}
