import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:flutter/material.dart';

import 'user_match_detail_match_row.dart';

class UserMatchDetailMatchCard extends StatelessWidget {
  final Game game;

  const UserMatchDetailMatchCard(this.game);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: MColor.kFill.alternative,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          UserMatchDetailMatchRow(label: '경기 일정', value: game.gameDate),
          SizedBox(height: 4),
          UserMatchDetailMatchRow(
              label: '경기', value: '${game.awayTeam.name} vs ${game.homeTeam.name}'),
          SizedBox(height: 4),
          UserMatchDetailMatchRow(label: '경기장', value: '${game.stadiumName}'),
        ],
      ),
    );
  }
}
