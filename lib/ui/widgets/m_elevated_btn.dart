import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class MElevatedBtn extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final VoidCallback onPressed;

  const MElevatedBtn({
    super.key,
    required this.text,
    this.isEnabled = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 61),
        backgroundColor: isEnabled ? MColor.kPrimary.strong : MColor.kFill.strong,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: MText.button2(text, color: Colors.white),
    );
  }
}
