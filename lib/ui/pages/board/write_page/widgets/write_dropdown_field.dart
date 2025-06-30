import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class WriteDropdownField extends StatelessWidget {
  final String? value;
  final String hintText;
  final List<String> items;
  final void Function(String?) onChanged;

  const WriteDropdownField({
    super.key,
    required this.value,
    required this.hintText,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: value,
      decoration: const InputDecoration(
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
        offset: const Offset(0, -10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: MColor.kLine.normal),
        ),
      ),
      hint: Text(
        hintText,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: MColor.kLabel.alternative,
        ),
      ),
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: MColor.kLabel.normal,
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
