import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/today_game_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/home_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_heading.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_today_game_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTodayGame extends ConsumerWidget {
  const HomeTodayGame({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final homeModel = ref.watch(homeProvider);
    if (homeModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      final games = homeModel.todayGameModel.games;
      return Column(
        children: [
          HomeHeading(
            title: '오늘의 경기',
            uri: TodayGamePage(),
          ),
          SizedBox(height: 14),
          HomeTodayGameSlider(games : games),
        ],
      );
    }
  }
}
