import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/_core/utils/m_util.dart';
import 'package:ballkkaye_frontend/data/model/user_match.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_tag.dart';
import 'package:flutter/material.dart';

class UserMatchDetailTagGroup extends StatelessWidget {
  final UserMatch userMatch;

  const UserMatchDetailTagGroup(this.userMatch, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        MTag(
            label: userMatch.gender,
            fillColor: MColor.kFill.normal,
            textColor: MColor.kLabel.neutral),
        MTag(
            label: formatAgeRange(userMatch.user.ageRange!),
            fillColor: MColor.kFill.normal,
            textColor: MColor.kLabel.neutral),
        MTag(
            label: userMatch.user.teamName!,
            fillColor: MColor.kFill.normal,
            textColor: MColor.kLabel.neutral),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2.5),
          child: Visibility(
            visible: userMatch.isSameTeam,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MIcon.page.userMatch.checkedBox,
                const SizedBox(width: 4),
                MText.valid('같은팀 이면 좋겠어요', color: MColor.kPrimary.strong)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
