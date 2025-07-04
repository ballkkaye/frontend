import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class MTextFormField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final int? maxLength;
  final TextInputType keyboardType;
  final String? initialValue;
  final bool isDense;
  final void Function(String)? onChanged;

  const MTextFormField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.initialValue,
    this.isDense = true,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      style: TextStyle(color: MColor.kLabel.neutral),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: MColor.kLabel.alternative),
        isDense: isDense,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: MColor.kLine.normal),
        ),
        contentPadding: EdgeInsets.all(15),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: MColor.kPrimary.strong,
            width: 2,
          ), // kLine.normal
        ),
      ),
      onChanged: onChanged,
    );
  }
}
