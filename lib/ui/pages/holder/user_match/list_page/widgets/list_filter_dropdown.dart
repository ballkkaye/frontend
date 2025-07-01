import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/widgets/list_filter_dropdown_btn.dart';
import 'package:flutter/material.dart';

class ListFilterDropdown extends StatefulWidget {
  const ListFilterDropdown({super.key});

  @override
  State<ListFilterDropdown> createState() => _ListFilterDropdownState();
}

class _ListFilterDropdownState extends State<ListFilterDropdown> {
  String selectedGender = '성별';
  String selectedAge = '연령대';
  String selectedTeam = '응원팀';

  final List<String> genders = ['남성', '여성'];
  final List<String> ages = ['~20대', '20대 ~ 30대', '30대 ~ 40대', '40대 이상', '연령 무관'];
  final List<String> teams = ['롯데', '두산', '삼성', 'SSG'];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 10,
        runSpacing: 8,
        children: [
          ListFilterDropdownBtn(
            label: '성별',
            selectedValue: selectedGender,
            options: genders,
            onChanged: (val) => setState(() => selectedGender = val),
          ),
          ListFilterDropdownBtn(
            label: '연령대',
            selectedValue: selectedAge,
            options: ages,
            onChanged: (val) => setState(() => selectedAge = val),
          ),
          ListFilterDropdownBtn(
            label: '응원팀',
            selectedValue: selectedTeam,
            options: teams,
            onChanged: (val) => setState(() => selectedTeam = val),
          ),
        ],
      ),
    );
  }
}
