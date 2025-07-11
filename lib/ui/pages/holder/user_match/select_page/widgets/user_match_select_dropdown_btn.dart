import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/select_page/user_match_select_game_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/write_page/user_match_write_fm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/write_page/user_match_write_page.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_dropdown_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserMatchSelectDropdownBtn extends ConsumerWidget {
  final String date;

  const UserMatchSelectDropdownBtn({super.key, required this.date});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserMatchSelectGameModel? gameModel = ref.watch(userMatchSelectGameProvider(date));
    UserMatchWriteFM fm = ref.read(userMatchWriteProvider.notifier);
    int? selectedGameId;

    if (gameModel == null) {
      return MDropdownBtn(
        hintText: '경기',
        items: [],
        onChanged: (_) {},
      );
    }

    return Column(
      children: [
        MDropdownBtn<Map<String, dynamic>>(
          hintText: '경기',
          items: gameModel.formatGameList(),
          itemLabel: (item) => item['game'],
          onChanged: (item) {
            if (item != null) {
              selectedGameId = item['gameId'];
              fm.gameId(selectedGameId!);
            }
          },
        ),
        SizedBox(height: 540),
        MElevatedBtn(
          text: '다음',
          onPressed: () {
            if (selectedGameId != null) {
              final Game selectedGame = gameModel.games.firstWhere((g) => g.id == selectedGameId);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserMatchWritePage(selectedGame: selectedGame),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("경기를 선택해주세요.")),
              );
            }
          },
        )
      ],
    );
  }
}
