import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/user_match.dart';
import 'package:flutter/material.dart';

class UserMatchDetailActionBar extends StatelessWidget {
  final UserMatch userMatch;

  const UserMatchDetailActionBar(this.userMatch, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MIcon.page.userMatch.like,
        Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end, //
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 2), //
              child: Text(
                '현재 ${userMatch.participationInfo}명 참여중',
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400, color: MColor.kLabel.alternative),
              ),
            ),
            SizedBox(width: 12.5),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: MColor.kPrimary.strong,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(horizontal: 21),
              ),
              child: MText.button1('채팅하기', color: MColor.kLabel.white),
            ),
          ],
        ),
      ],
    );
  }
}
