import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class UserMatchListCardTag extends StatelessWidget {
  final String label;

  const UserMatchListCardTag({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: MColor.kFill.normal,
        borderRadius: BorderRadius.circular(15),
      ),
      child: MText.label3(label),
    );
  }
}
