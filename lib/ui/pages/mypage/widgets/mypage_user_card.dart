import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:flutter/material.dart';

class MypageUserCard extends StatelessWidget {
  const MypageUserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MColor.kBackground.normal,
          borderRadius: BorderRadius.circular(8),
          boxShadow: MColor.kShadow.normal),
      child: ListTile(
        leading: ClipOval(
          child: Container(
            width: 30,
            height: 30,
            color: Colors.grey.shade300,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 21,
                height: 21,
                child: MIcon.page.mypage.userDummy,
              ),
            ),
          ),
        ),
        title: Text('ssar',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: MColor.kLabel.normal,
              height: 1.2,
            )),
        subtitle: Text('롯데 자이언츠',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: MColor.kLabel.neutral,
              height: 1.2,
            )),
        trailing: Icon(Icons.chevron_right),
        onTap: () {}, // 프로필 상세 이동
      ),
    );
  }
}
