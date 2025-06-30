import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class DetailMatchRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailMatchRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MColor.kLabel.normal,
                fontSize: 14)),
        MText.label1_5(value, color: MColor.kLabel.normal),
      ],
    );
  }
}
