import 'package:ballkkaye_frontend/_core/style/m_color.dart';
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
          child: Text(
            '$value',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: value == 0 ? MColor.kLabel.alternative : MColor.kLabel.normal,
            ),
          ),
        ),
        Container(
          width: 34,
          height: 24,
          alignment: Alignment.center,
          child: Text(
            '${hour}시',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: MColor.kLabel.normal,
            ),
          ),
        ),
      ],
    );
  }
}
