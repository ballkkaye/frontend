import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class MToggleBtn extends StatelessWidget {
  final List<String> options;
  final String? selectedValue;
  final void Function(String) onSelected;

  const MToggleBtn({
    super.key,
    required this.options,
    this.selectedValue,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(options.length, (index) {
        final value = options[index];

        return Expanded(
          child: Material(
            child: InkWell(
              onTap: () => onSelected(value),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: selectedValue == value ? MColor.kPrimary.strong : MColor.kLine.normal,
                    // width: 2
                  ),
                  borderRadius: _buildRadius(index),
                ),
                child: MText.button3(
                  value,
                  color:
                      selectedValue == value ? MColor.kPrimary.strong : MColor.kLabel.alternative,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  // 첫번째, 마지막 버튼만 둥글게
  BorderRadius? _buildRadius(int index) {
    if (index == 0) {
      return const BorderRadius.only(
        topLeft: Radius.circular(8),
        bottomLeft: Radius.circular(8),
      );
    } else if (index == options.length - 1) {
      return const BorderRadius.only(
        topRight: Radius.circular(8),
        bottomRight: Radius.circular(8),
      );
    } else {
      return null;
    }
  }
}
