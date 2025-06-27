import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

import 'user_match_detail_tag.dart';

class UserMatchDetailTagGroup extends StatelessWidget {
  const UserMatchDetailTagGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        UserMatchDetailTag(label: '여성'),
        UserMatchDetailTag(label: '20대 이상'),
        UserMatchDetailTag(label: '롯데 자이언츠'),
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
