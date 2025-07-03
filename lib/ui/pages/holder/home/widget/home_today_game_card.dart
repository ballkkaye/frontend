import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/widget/today_game_card_content.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/widget/today_game_ticket_btn.dart';
import 'package:flutter/material.dart';

class HomeTodayGameCard extends StatelessWidget {
  final String? leftPhotoUrl;
  final String? rightPhotoUrl;
  final String gameState;
  final String stadium;
  final TimeOfDay gameTime;
  final String broadcastInfo;
  final String leftPitcher;
  final String rightPitcher;
  final String ticketUrl;

  const HomeTodayGameCard({
    super.key,
    this.leftPhotoUrl,
    this.rightPhotoUrl,
    required this.gameState,
    required this.stadium,
    required this.gameTime,
    required this.broadcastInfo,
    required this.leftPitcher,
    required this.rightPitcher,
    required this.ticketUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: MColor.kShadow.normal,
        color: Colors.white,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TodayGameCardContent(
            rightPhotoUrl: rightPhotoUrl,
            leftPhotoUrl: leftPhotoUrl,
            gameState: gameState,
            stadium: stadium,
            gameTime: gameTime,
            broadcastInfo: broadcastInfo,
            leftPitcher: leftPitcher,
            rightPitcher: leftPitcher,
          ),
          TodayGameTicketBtn(ticketUrl: ticketUrl),
        ],
      ),
    );
  }
}
