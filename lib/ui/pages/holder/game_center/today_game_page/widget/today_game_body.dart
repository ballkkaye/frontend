import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/today_game_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/widget/today_game_calender.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/widget/today_game_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodayGameBody extends ConsumerWidget {
  const TodayGameBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayGameModel = ref.watch(todayGameProvider);

    if (todayGameModel == null) {
      return Center(
          child:
              MText.normal3_6("오늘의 경기가 없습니다.", color: MColor.kLabel.disable));
    } else {
      return ListView(
        padding: const EdgeInsets.only(top: 22, left: 16, right: 16),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TodayGameCalender(),
          ),
          SizedBox(height: 10),
          ...todayGameModel.games
              .map((game) => TodayGameCard(game: game))
              .toList(),
        ],
      );
    }
  }
}
