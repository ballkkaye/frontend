import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class MTextFormField extends StatelessWidget {
  final String? hintText;
  final int maxLines;
  final int? maxLength;
  final String? initialValue;
  final bool isDense;
  final void Function(String)? onChanged;

  const MTextFormField({
    super.key,
    this.hintText,
    this.maxLines = 1,
    this.maxLength,
    this.initialValue,
    this.isDense = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLines,
      maxLength: maxLength,
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
