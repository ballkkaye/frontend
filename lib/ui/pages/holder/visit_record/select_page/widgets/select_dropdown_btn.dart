import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class SelectDropdownBtn extends StatelessWidget {
  const SelectDropdownBtn({
    super.key,
    required this.selectedGame,
    required this.games,
  });

  final String selectedGame;
  final List<String> games;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: selectedGame,
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
      hint: Text(
        '경기',
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: MColor.kLabel.alternative),
      ),
      items: games.map((game) {
        return DropdownMenuItem<String>(
          value: game,
          child: Text(
            game,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: MColor.kLabel.normal,
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        // TODO: 상태 관리
      },
    );
  }
}
