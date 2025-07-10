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
    final todayGameState = ref.watch(todayGameProvider);

    if (todayGameState == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView(
      padding: const EdgeInsets.only(top: 22, left: 16, right: 16),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TodayGameCalender(),
        ),
        SizedBox(height: 10),
        ...todayGameState.games.map((game) => TodayGameCard(game: game)).toList(),
      ],
    );
  }
}
