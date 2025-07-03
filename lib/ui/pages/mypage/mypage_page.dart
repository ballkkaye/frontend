import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

import 'widgets/mypage_body.dart';
import 'widgets/mypage_nav_bar.dart';

class MypagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: MypageBody(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, '/user/detail');
      }),
      bottomNavigationBar: MypageNavBar(
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
      centerTitle: true,
      title: MText.h1('마이페이지', color: MColor.kLabel.normal),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    );
  }
}
