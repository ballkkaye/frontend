import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class UserMatchUpdateSelectButton extends StatefulWidget {
  final List<String> options;
  final String hintText;
  final void Function(String?)? onChanged;

  const UserMatchUpdateSelectButton({
    super.key,
    required this.options,
    required this.hintText,
    this.onChanged,
  });

  @override
  State<UserMatchUpdateSelectButton> createState() => _UserMatchUpdateSelectButtonState();
}

class _UserMatchUpdateSelectButtonState extends State<UserMatchUpdateSelectButton> {
  String? selectedValue;
  bool isDropdownOpened = false;

  @override
  Widget build(BuildContext context) {
    final bool isActive = selectedValue != null || isDropdownOpened;

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          widget.hintText,
          style: TextStyle(
            color: isActive ? Colors.black : MColor.kLabel.alternative,
            fontSize: 16,
            fontWeight: FontWeight.w400
          ),
        ),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value == '선택 안함' ? null : value;
            isDropdownOpened = false;
          });
          widget.onChanged?.call(value);
        },
        items: [
          DropdownMenuItem<String>(
            value: '선택 안함',
            child: MText.modal2_4('선택 안함',color: MColor.kLabel.alternative),
            ),
          ...widget.options.map((option) {
            return DropdownMenuItem<String>(
              value: option,
              child: MText.modal2_4(option,color: MColor.kLabel.alternative),
            );
          }).toList(),
        ],
        buttonStyleData: ButtonStyleData(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: isActive ? MColor.kPrimary.strong : MColor.kLine.normal,
              width: isActive ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(color: MColor.kLine.normal),
          ),
          offset: const Offset(0, -5),
          maxHeight: 240,
        ),
        iconStyleData: IconStyleData(
          icon: Icon(Icons.arrow_drop_down, color: MColor.kLine.normal),
        ),
        onMenuStateChange: (isOpen) {
          setState(() {
            isDropdownOpened = isOpen;
          });
        },
      ),
    );
  }
}
