import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/widget/today_game_info_list.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/widget/today_game_label.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/widget/today_game_pitchers.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/widget/today_game_team_logo.dart';
import 'package:flutter/material.dart';

class TodayGameCardContent extends StatelessWidget {
  final String? leftPhotoUrl;
  final String? rightPhotoUrl;
  final String gameState;
  final String stadium;
  final TimeOfDay gameTime;
  final String broadcastInfo;
  final String leftPitcher;
  final String rightPitcher;

  const TodayGameCardContent({
    super.key,
    this.leftPhotoUrl,
    this.rightPhotoUrl,
    required this.gameState,
    required this.stadium,
    required this.gameTime,
    required this.broadcastInfo,
    required this.leftPitcher,
    required this.rightPitcher,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TodayGameTeamLogo(photoUrl: leftPhotoUrl),
          Column(
            children: [
              TodayGameLabel(gameState: gameState),
              SizedBox(height: 12),
              TodayGameInfoList(
                stadium: stadium,
                gameTime: gameTime,
                broadcastInfo: broadcastInfo,
              ),
              SizedBox(height: 12),
              TodayGamePitchers(leftPitcher: leftPitcher, rightPitcher: rightPitcher),
            ],
          ),
          TodayGameTeamLogo(photoUrl: rightPhotoUrl),
        ],
      ),
    );
  }
}
