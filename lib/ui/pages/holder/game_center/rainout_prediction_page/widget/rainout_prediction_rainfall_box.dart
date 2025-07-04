import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class RainoutPredictionRainfallBox extends StatelessWidget {
  final int value;
  final String hour;

  const RainoutPredictionRainfallBox({
    super.key,
    required this.value,
    required this.hour,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 34,
          height: 24,
          color: value == 0 ? MColor.kFill.normal : Color(0x664EE1BB),
          alignment: Alignment.center,
          child: MText.normal8_6(
            '$value',
            color: value == 0 ? MColor.kLabel.alternative : MColor.kLabel.normal,
          ),
        ),
        Container(
          width: 34,
          height: 24,
          alignment: Alignment.center,
          child: MText.normal8_4(
            '${hour}시',
            color: MColor.kLabel.normal,
          ),
        ),
      ],
    );
  }
}
