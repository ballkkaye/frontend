import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class DetailProfile extends StatelessWidget {
  const DetailProfile({
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
            MText.h3_7("ssar"),
            MText.label1_5("롯데자이언트", color: Colors.grey),
          ],
        ),
        Spacer(),
        Text('15분전',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
      ],
    );
  }
}
