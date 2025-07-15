import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/utils/m_util.dart';
import 'package:ballkkaye_frontend/data/enum/game_status.dart';
import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/widget/today_game_card_content.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/widget/today_game_ticket_btn.dart';
import 'package:flutter/material.dart';

class TodayGameCard extends StatelessWidget {
  final Game game;

  const TodayGameCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: MColor.kShadow.normal,
            color: Colors.white,
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              TodayGameCardContent(
                  rightPhotoUrl: game.homeTeam.teamLogo,
                  leftPhotoUrl: game.awayTeam.teamLogo,
                  gameState: game.gameStatus?.label ?? '경기 예정',
                  stadium: shortenStadiumName(game.stadiumName ?? ''),
                  gameTime: _parseTime(game.gameTime),
                  broadcastInfo: game.broadcastChannel ?? '',
                  leftPitcher: game.homePitcherName ?? '',
                  rightPitcher: game.awayPitcherName ?? ''),
              TodayGameTicketBtn(ticketUrl: game.ticketLink ?? ''),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  TimeOfDay _parseTime(String? timeStr) {
    if (timeStr == null || !timeStr.contains(':'))
      return const TimeOfDay(hour: 0, minute: 0);
    final parts = timeStr.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }
}
