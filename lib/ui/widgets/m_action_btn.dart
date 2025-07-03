import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/cupertino.dart';

class MActionBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MActionBtn({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: MText.modal2_4(text, color: MColor.kLabel.strong),
    );
  }
}
