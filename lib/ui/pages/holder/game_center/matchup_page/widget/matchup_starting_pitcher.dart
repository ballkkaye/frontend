import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/matchup_page/widget/matchup_player_image.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/matchup_page/widget/matchup_player_stat_list.dart';
import 'package:flutter/material.dart';

class MatchupStartingPitcher extends StatelessWidget {
  final String profileUrl;
  final String name;
  final int gameCount;
  final String result;
  final double era;
  final double whip;
  final int qs;

  const MatchupStartingPitcher({
    super.key,
    required this.profileUrl,
    required this.name,
    required this.gameCount,
    required this.result,
    required this.era,
    required this.whip,
    required this.qs,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 80,
                child: AspectRatio(
                  aspectRatio: 5 / 7,
                  child: Container(
                    decoration: BoxDecoration(
                      color: MColor.kFill.normal,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: MatchupPlayerImage(profileUrl),
                  ),
                ),
              ),
              SizedBox(width: 16), // 간격
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MText.normal4_6(
                    name,
                    color: MColor.kLabel.normal,
                  ),
                  MatchupPlayerStatList(
                    gameCount: gameCount,
                    result: result,
                    era: era,
                    whip: whip,
                    qs: qs,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
