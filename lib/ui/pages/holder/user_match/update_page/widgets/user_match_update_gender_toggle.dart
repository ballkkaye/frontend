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
        border: Border.all(color: Colors.grey.shade300),
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
                  border: Border(
                    left: index == 0 ? BorderSide.none : BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  genderOptions[index],
                  style: TextStyle(
                    color: selected ? Colors.teal : Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
