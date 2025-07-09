import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class MTag extends StatelessWidget {
  final String? label;
  final Color fillColor;
  final Color textColor;

  const MTag({
    super.key,
    required this.label,
    required this.fillColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Padding(
        padding: EdgeInsets.only(right: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: MText.label3(label!, color: textColor),
        ),
      ),
    );
  }

  bool get _isVisible {
    if (label == null || label!.isEmpty) return false;
    if (label == "연령 무관" || label == "무관") return false;
    return true;
  }
}
