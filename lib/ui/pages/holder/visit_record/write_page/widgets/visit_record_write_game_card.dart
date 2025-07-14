import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:flutter/material.dart';

class VisitRecordWriteGameCard extends StatelessWidget {
  final VisitRecord selectedGame;

  const VisitRecordWriteGameCard({
    super.key,
    required this.selectedGame,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: MColor.kShadow.normal,
          borderRadius: BorderRadius.circular(8),
          color: MColor.kBackground.normal,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MText.normal1_7("${selectedGame.awayScore}", color: MColor.kLabel.disable),
              Column(
                children: [
                  Row(
                    children: [
                      MText.h1(selectedGame.awayTeamName, color: MColor.kLabel.normal),
                      SizedBox(width: 16),
                      MText.normal7_6("vs", color: MColor.kLabel.alternative),
                      SizedBox(width: 16),
                      MText.h1(selectedGame.homeTeamName, color: MColor.kLabel.normal),
                    ],
                  ),
                  SizedBox(height: 8),
                  MText.normal8_5(selectedGame.gameDate, color: MColor.kLabel.alternative),
                  MText.normal8_5(selectedGame.stadiumName, color: MColor.kLabel.alternative),
                ],
              ),
              MText.normal1_7("${selectedGame.homeScore}", color: MColor.kPrimary.strong),
            ],
          ),
        ),
      ),
    );
  }
}
