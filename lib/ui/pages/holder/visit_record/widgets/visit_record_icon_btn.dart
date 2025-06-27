import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class VisitRecordIconBtn extends StatelessWidget {
  const VisitRecordIconBtn({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    this.onPressed,
  });

  final Widget icon;
  final String text;
  final Color color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
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
