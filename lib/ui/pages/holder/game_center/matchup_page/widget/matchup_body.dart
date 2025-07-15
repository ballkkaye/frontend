import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/param/matchup_param.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/matchup_page/matchup_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/matchup_page/widget/matchup_chart.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/matchup_page/widget/matchup_starting_pitcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchupBody extends ConsumerWidget {
  final int gameId;
  final int teamId;

  const MatchupBody({
    super.key,
    required this.gameId,
    required this.teamId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref
        .watch(matchupProvider(MatchupParam(gameId: gameId, teamId: teamId)));

    if (model == null) {
      return Center(
          child: MText.normal3_6("오늘의 라인업 등록 전입니다.",
              color: MColor.kLabel.disable));
    } else {
      return Padding(
        padding: const EdgeInsets.only(
          top: 22,
          left: 16,
          right: 16,
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MText.h2('상대팀 선발 투수'),
                SizedBox(height: 12),
                MatchupStartingPitcher(
                  profileUrl: model.profileUrl,
                  name: model.name,
                  gameCount: model.gameCount,
                  result: model.result,
                  era: model.era,
                  whip: model.whip,
                  qs: model.qs,
                ),
                SizedBox(height: 22),
                Container(
                  decoration: BoxDecoration(
                    color: MColor.kPrimary.strong,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  child:
                      MText.label1_6('2025 상대 전적', color: MColor.kLabel.white),
                ),
                SizedBox(height: 6),
              ],
            ),
            MatchupChart(hitters: model.hitters),
          ],
        ),
      );
    }
  }
}
