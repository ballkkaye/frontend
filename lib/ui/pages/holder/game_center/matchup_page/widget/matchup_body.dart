import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/matchup.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/matchup_page/matchup_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/matchup_page/widget/matchup_chart.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/matchup_page/widget/matchup_starting_pitcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchupBody extends ConsumerWidget {
  const MatchupBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(MatchupProvider(MatchupParam(gameId: 423, teamId: 2)));

    if (model == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.only(
        top: 22,
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MText.h2('상태팀 선발 투수'),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: MColor.kPrimary.strong,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 4,
                ),
                child: MText.label1_6('2025 상대 전적', color: MColor.kLabel.white),
              ),
              SizedBox(height: 6),
              MatchupChart(hitters: model.hitters),
            ],
          ),
        ],
      ),
    );
  }
}
