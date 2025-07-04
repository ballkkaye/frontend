import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_tag.dart';
import 'package:flutter/material.dart';

class UserMatchDetailTagGroup extends StatelessWidget {
  const UserMatchDetailTagGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        MTag(label: '여성', fillColor: MColor.kFill.normal, textColor: MColor.kLabel.neutral),
        MTag(label: '20대 이상', fillColor: MColor.kFill.normal, textColor: MColor.kLabel.neutral),
        MTag(label: '롯데 자이언츠', fillColor: MColor.kFill.normal, textColor: MColor.kLabel.neutral),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2.5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MIcon.page.userMatch.checkedBox,
              const SizedBox(width: 4),
              MText.valid('같은팀 이면 좋겠어요', color: MColor.kPrimary.strong)
            ],
          ),
        ),
      ],
    );
  }
}
