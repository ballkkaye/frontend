import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MSelectButton extends StatefulWidget {
  final List<String> options;
  final String hintText;
  final double fontSize;
  final double height;
  final double buttonWidth;
  final double dropdownWidth;
  final Color? selectedTextColor;
  final Color? hintTextColor;
  final void Function(String?)? onChanged;

  const MSelectButton({
    super.key,
    required this.options,
    required this.hintText,
    this.fontSize = 13,
    this.height = 36,
    this.buttonWidth = 90,
    this.dropdownWidth = 200,
    this.selectedTextColor,
    this.hintTextColor,
    this.onChanged,
  });

  @override
  State<MSelectButton> createState() => _MSelectButtonState();
}

class _MSelectButtonState extends State<MSelectButton> {
  String? selectedValue;
  bool isDropdownOpened = false;

  @override
  Widget build(BuildContext context) {
    final bool isActive = selectedValue != null || isDropdownOpened;

    return SizedBox(
      width: widget.buttonWidth,
      height: widget.height,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            widget.hintText,
            style: TextStyle(
              color: widget.hintTextColor ?? MColor.kLabel.alternative,
              fontSize: widget.fontSize,
            ),
          ),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
              isDropdownOpened = false;
            });
            widget.onChanged?.call(value);
          },
          items: widget.options
              .map((option) => DropdownMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      style: TextStyle(
                        fontSize: widget.fontSize,
                        color: widget.selectedTextColor ?? MColor.kLabel.normal,
                      ),
                    ),
                  ))
              .toList(),
          buttonStyleData: ButtonStyleData(
            height: widget.height,
            width: widget.buttonWidth,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: isActive ? MColor.kPrimary.alternative : MColor.kLine.alternative,
                width: isActive ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            width: widget.dropdownWidth,
            maxHeight: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: MColor.kLine.alternative),
            ),
            offset: const Offset(0, 4),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.arrow_drop_down, color: Color(0xFFB4B4B4)),
          ),
          onMenuStateChange: (isOpen) {
            setState(() {
              isDropdownOpened = isOpen;
            });
          },
        ),
      ),
    );
  }
}
