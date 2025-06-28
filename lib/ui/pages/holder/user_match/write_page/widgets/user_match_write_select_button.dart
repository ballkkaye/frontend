import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class SelectButton extends StatefulWidget {
  final List<String> options;
  final String hintText;
  final void Function(String?)? onChanged;

  const SelectButton({
    super.key,
    required this.options,
    required this.hintText,
    this.onChanged,
  });

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
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
            color: isActive ? Colors.black : Colors.grey,
            fontSize: 16,
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
        items: [
          const DropdownMenuItem<String>(
            value: null,
            child: Text(
              '선택 안함',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ...widget.options.map((option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
        ],
        buttonStyleData: ButtonStyleData(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(
              color: isActive ? Colors.teal : Colors.grey.shade400,
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
            border: Border.all(color: Colors.grey.shade200),
          ),
          offset: const Offset(0, 4),
          maxHeight: 240,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
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
