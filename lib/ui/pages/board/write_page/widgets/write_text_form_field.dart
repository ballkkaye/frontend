import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class WriteTextFormField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final String? initialValue;
  final bool isDense;
  final void Function(String)? onChanged;

  const WriteTextFormField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    required this.initialValue,
    this.isDense = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: MColor.kLabel.disable),
        isDense: isDense,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: MColor.kLine.normal),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: MColor.kLine.normal),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
