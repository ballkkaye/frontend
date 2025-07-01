import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

import 'widgets/my_bottom_navigation_bar.dart';
import 'widgets/mypage_body.dart';

class MypagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: MypageBody(),
      bottomNavigationBar: MyBottomNavigationBar(
        //임시 내비게이션바
        currentIndex: 2,
        onTap: (index) {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: MText.h1(
          '마이페이지',
          color: MColor.kLabel.normal,
        ),
      ),
      backgroundColor: MColor.kBackground.normal,
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: 70,
    );
  }
}
