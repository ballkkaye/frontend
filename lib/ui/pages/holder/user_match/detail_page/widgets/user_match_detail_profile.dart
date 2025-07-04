import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class UserMatchDetailProfile extends StatelessWidget {
  const UserMatchDetailProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: ClipOval(
            child: Container(
              width: 31,
              height: 31,
              color: Colors.grey[300],
              child: Align(
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
            MText.normal4_600("ssar"),
            MText.normal6_500("롯데자이언트", color: MColor.kLabel.alternative),
          ],
        ),
        Spacer(),
        MText.normal7_400('15분전', color: MColor.kLabel.normal),
      ],
    );
  }
}
