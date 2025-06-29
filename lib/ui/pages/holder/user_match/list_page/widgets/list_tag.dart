import 'package:flutter/material.dart';

class ListTag extends StatelessWidget {
// 텍스트 기반 말풍선 위젯 (동행 태그, 채팅 말풍선 등 재사용 목적)
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final EdgeInsetsGeometry padding;

  const ListTag({
    super.key,
    required this.label,
    this.backgroundColor = const Color(0xFFF0F0F0),
    this.textColor = const Color(0xFF333333),
    this.fontSize = 13,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }
}
