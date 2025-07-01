import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class TodayGameLabel extends StatelessWidget {
  final String gameState;

  const TodayGameLabel({
    super.key,
    required this.gameState,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: gameState == '경기예정'
            ? MColor.kStatus.cautionary
            : gameState == '경기중'
                ? MColor.kStatus.positive
                : MColor.kStatus.negative,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Text(
          gameState,
          style: TextStyle(
            height: 1,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: MColor.kLabel.white,
          ),
        ),
      ),
    );
  }
}
