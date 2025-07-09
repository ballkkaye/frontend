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
        final width = constraints.maxWidth;
        final imageWidth = width * (120 / 328);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: imageWidth,
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
              SizedBox(width: 12), // 간격
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MText.normal4_6(
                      name,
                      color: MColor.kLabel.normal,
                    ),
                    SizedBox(height: 2),
                    MatchupPlayerStatList(
                      gameCount: gameCount,
                      result: result,
                      era: era,
                      whip: whip,
                      qs: qs,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
