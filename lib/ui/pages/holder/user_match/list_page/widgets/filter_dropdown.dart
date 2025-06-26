import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class FilterDropdown extends StatefulWidget {
  @override
  State<FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  String selectedGender = '성별';
  String selectedAge = '연령대';
  String selectedTeam = '응원팀';

  final List<String> genders = ['남성', '여성'];
  final List<String> ages = ['~20대', '20대 ~ 30대', '30대 ~ 40대', '40대 이상', '연령 무관'];
  final List<String> teams = ['롯데', '두산', '삼성', 'SSG'];

  Widget buildFilterDropdown(
    String label,
    String selectedValue,
    List<String> options,
    void Function(String) onChanged,
  ) {
    final bool isSelected = selectedValue != label;

    return Theme(
      data: Theme.of(context).copyWith(
        popupMenuTheme: PopupMenuThemeData(
          color: Colors.white,
        ),
      ),
      child: PopupMenuButton<String>(
        onSelected: onChanged,
        itemBuilder: (context) => options
            .map((value) => PopupMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.black),
                  ),
                ))
            .toList(),
        offset: const Offset(0, 40),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? MColor.kPrimary.alternative : Colors.grey.shade300,
              width: 1.5,
            ),
            color: Colors.white,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                selectedValue == '선택 안함' ? label : selectedValue,
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? MColor.kPrimary.alternative : Colors.black45,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_drop_down,
                size: 20,
                color: isSelected ? MColor.kPrimary.alternative : Colors.black38,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4), // 카드와 간격 통일
      child: Align(
        alignment: Alignment.centerLeft, // ⬅️ Wrap 전체 왼쪽 정렬
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 8,
          runSpacing: 8,
          children: [
            buildFilterDropdown('성별', selectedGender, genders, (val) => setState(() => selectedGender = val)),
            buildFilterDropdown('연령대', selectedAge, ages, (val) => setState(() => selectedAge = val)),
            buildFilterDropdown('응원팀', selectedTeam, teams, (val) => setState(() => selectedTeam = val)),
          ],
        ),
      ),
    );
  }
}
