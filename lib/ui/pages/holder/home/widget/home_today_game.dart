import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/today_game_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_heading.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_today_game_slider.dart';
import 'package:flutter/material.dart';

class HomeTodayGame extends StatelessWidget {
  const HomeTodayGame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeHeading(
          title: '오늘의 경기',
          uri: TodayGamePage(),
        ),
        SizedBox(height: 14),
        HomeTodatGameSlider(),
      ],
    );
  }
}
