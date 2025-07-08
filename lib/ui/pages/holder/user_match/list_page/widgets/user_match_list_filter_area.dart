import 'package:ballkkaye_frontend/data/enum/age.dart';
import 'package:ballkkaye_frontend/data/enum/gender.dart';
import 'package:ballkkaye_frontend/data/model/team.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/user_match_list_team_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/user_match_list_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/widgets/user_match_list_dropdown_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserMatchListFilterArea extends ConsumerStatefulWidget {
  UserMatchListModel? model;

  UserMatchListFilterArea(this.model);

  @override
  ConsumerState<UserMatchListFilterArea> createState() => _UserMatchListFilterAreaState();
}

class _UserMatchListFilterAreaState extends ConsumerState<UserMatchListFilterArea> {
  Gender? selectedGender;
  Age? selectedAge;
  Team? selectedTeam;

  @override
  Widget build(BuildContext context) {
    UserMatchListTeamModel? teamModel = ref.watch(userMatchListTeamProvider);

    if (teamModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
          spacing: 10,
          runSpacing: 8,
          children: [
            UserMatchListDropdownBtn<Gender>(
              label: '성별',
              selectedValue: selectedGender,
              options: Gender.values,
              getLabel: (g) => g.label,
              onChanged: (val) => setState(() => selectedGender = val),
            ),
            UserMatchListDropdownBtn<Age>(
              label: '연령대',
              selectedValue: selectedAge,
              options: Age.values,
              getLabel: (a) => a.label,
              onChanged: (val) => setState(() => selectedAge = val),
            ),
            UserMatchListDropdownBtn<Team>(
              label: '응원팀',
              selectedValue: selectedTeam,
              options: teamModel.teams,
              getLabel: (team) => team.label,
              onChanged: (val) => setState(() => selectedTeam = val),
            ),
          ],
        ),
      );
    }
  }
}
