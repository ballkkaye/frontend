import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class RainoutPredictionRainPerBox extends StatelessWidget {
  final int value;

  const RainoutPredictionRainPerBox({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 24,
      color: value == 0 ? MColor.kFill.normal : Color(0x664EE1BB),
      alignment: Alignment.center,
      child: Text(
        '${value}%',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: value == 0 ? MColor.kLabel.alternative : MColor.kLabel.normal,
        ),
      ),
    );
  }
}
