import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:flutter/material.dart';

class MypageNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MypageNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12.0,
      unselectedFontSize: 12.0,
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(label: "예측", icon: MIcon.nav.bottom.prediction),
        BottomNavigationBarItem(label: "직관기록", icon: MIcon.nav.bottom.record),
        BottomNavigationBarItem(label: "홈", icon: MIcon.nav.bottom.home),
        BottomNavigationBarItem(label: "채팅", icon: MIcon.nav.bottom.chat),
        BottomNavigationBarItem(label: "동행", icon: MIcon.nav.bottom.match),
      ],
    );
  }
}
