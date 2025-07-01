import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class TodayGameInfoList extends StatelessWidget {
  final String stadium;
  final TimeOfDay gameTime;
  final String broadcastInfo;

  const TodayGameInfoList({
    super.key,
    required this.stadium,
    required this.gameTime,
    required this.broadcastInfo,
  });

  @override
  Widget build(BuildContext context) {
    // 항상 두자리수로 시분 표시 포맷
    final timeText = MaterialLocalizations.of(context).formatTimeOfDay(
      gameTime,
      alwaysUse24HourFormat: true,
    );

    return Column(
      children: [
        Row(
          children: [
            MText.h2('${stadium}, ${timeText}', color: MColor.kLabel.normal),
          ],
        ),
        SizedBox(height: 4),
        Text(
          broadcastInfo,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: MColor.kLabel.normal,
          ),
        )
      ],
    );
  }
}
