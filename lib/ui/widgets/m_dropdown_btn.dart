import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MDropdownBtn extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? value;

  const MDropdownBtn({
    super.key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: value,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
      ),
      buttonStyleData: ButtonStyleData(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: MColor.kLine.normal),
        ),
      ),
      dropdownStyleData: DropdownStyleData(
        offset: Offset(0, -10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: MColor.kLine.normal),
        ),
      ),
      hint: MText.input1_4(hintText, color: MColor.kLabel.alternative),
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: MText.input1_4(item, color: MColor.kLabel.neutral),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
