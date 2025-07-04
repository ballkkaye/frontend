import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class ListFilterDropdownBtn extends StatelessWidget {
  final String label;
  final String selectedValue;
  final List<String> options;
  final ValueChanged<String> onChanged;

  const ListFilterDropdownBtn({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedValue != label;

    return Theme(
      data: Theme.of(context).copyWith(
        popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
      ),
      child: PopupMenuButton<String>(
        onSelected: onChanged,
        itemBuilder: (context) => options
            .map((value) => PopupMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(color: Colors.black)),
                ))
            .toList(),
        offset: const Offset(0, 40),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? MColor.kPrimary.alternative : MColor.kBackground.normal,
              width: 1.5,
            ),
            boxShadow: MColor.kShadow.normal,
            color: Colors.white,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MText.button4_4(
                selectedValue == '선택 안함' ? label : selectedValue,
                color: isSelected ? MColor.kPrimary.strong : MColor.kLabel.alternative,
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_drop_down,
                size: 20,
                color: isSelected ? MColor.kPrimary.strong : MColor.kLabel.alternative,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
