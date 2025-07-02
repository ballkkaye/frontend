import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class MIconBtn extends StatelessWidget {
  const MIconBtn({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.textColor,
  });

  final Widget icon;
  final String text;
  final VoidCallback onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: MText.button3(text, color: textColor),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: BorderSide(
            color: MColor.kLine.normal,
          ),
          padding: EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}
