import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/user_match.dart';
import 'package:flutter/material.dart';

class UserMatchDetailProfile extends StatelessWidget {
  final UserMatch userMatch;

  const UserMatchDetailProfile(this.userMatch, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: ClipOval(
            child: Container(
              width: 40,
              height: 40,
              color: MColor.kFill.normal,
              child: userMatch.user.profileUrl != null && userMatch.user.profileUrl!.isNotEmpty
                  ? Image.network(
                      userMatch.user.profileUrl!,
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                    )
                  : Align(
                      alignment: Alignment(0, 1),
                      child: MIcon.page.mypage.userDummy,
                    ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MText.normal4_6(userMatch.user.nickname),
            MText.normal6_5(userMatch.user.teamName, color: MColor.kLabel.alternative),
          ],
        ),
        Spacer(),
        MText.normal7_4(userMatch.relativeTime, color: MColor.kLabel.normal),
      ],
    );
  }
}
