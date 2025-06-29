import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class UserMatchUpdateGenderToggle extends StatefulWidget {
  const UserMatchUpdateGenderToggle({super.key});

  @override
  State<UserMatchUpdateGenderToggle> createState() => _UserMatchUpdateGenderToggleState();
}

class _UserMatchUpdateGenderToggleState extends State<UserMatchUpdateGenderToggle> {
  List<bool> isSelected = [false, false, false];
  final List<String> genderOptions = ['남성', '여성', '무관'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        border: Border.all(color: MColor.kLine.normal),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: List.generate(genderOptions.length, (index) {
          final selected = isSelected[index];
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = i == index;
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: selected ? Colors.teal.shade50 : Colors.white,
                  border: Border.all(
                    color: selected ? MColor.kPrimary.strong : MColor.kLine.alternative,
                    width: 1,
                  ),
                  borderRadius: index == 0
                      ? const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  )
                      : index == isSelected.length - 1
                      ? const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  )
                      : BorderRadius.zero,
                ),
                alignment: Alignment.center,
                child: MText.button3(genderOptions[index],color: selected ? MColor.kPrimary.strong : MColor.kLabel.alternative)
              ),
            ),
          );
        }),
      ),
    );
  }
}
