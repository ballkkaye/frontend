import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/widgets/user_match_list_filter_dropdown_button.dart';
import 'package:flutter/material.dart';

class UserMatchListFilterDropdown extends StatefulWidget {
  const UserMatchListFilterDropdown({super.key});

  @override
  State<UserMatchListFilterDropdown> createState() => _UserMatchListFilterDropdownState();
}

class _UserMatchListFilterDropdownState extends State<UserMatchListFilterDropdown> {
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
          UserMatchListFilterDropdownButton(
            label: '성별',
            selectedValue: selectedGender,
            options: genders,
            onChanged: (val) => setState(() => selectedGender = val),
          ),
          UserMatchListFilterDropdownButton(
            label: '연령대',
            selectedValue: selectedAge,
            options: ages,
            onChanged: (val) => setState(() => selectedAge = val),
          ),
          UserMatchListFilterDropdownButton(
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
