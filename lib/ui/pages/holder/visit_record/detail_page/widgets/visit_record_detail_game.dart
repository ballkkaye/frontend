import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:flutter/material.dart';

class VisitRecordDetailGame extends StatelessWidget {
  VisitRecord record;

  VisitRecordDetailGame({
    super.key,
    required this.record,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MText.normal1_7('${record.homeScore}', color: MColor.kLabel.disable),
        Column(
          children: [
            Row(
              children: [
                MText.h1(record.homeTeamName, color: MColor.kLabel.normal),
                SizedBox(width: 16),
                MText.normal7_6("vs", color: MColor.kLabel.alternative),
                SizedBox(width: 16),
                MText.h1(record.awayTeamName, color: MColor.kLabel.normal),
              ],
            ),
            SizedBox(height: 8),
            MText.normal8_5(record.gameDate, color: MColor.kLabel.alternative),
            MText.normal8_5(record.stadiumName,
                color: MColor.kLabel.alternative),
          ],
        ),
        MText.normal1_7('${record.awayScore}', color: MColor.kPrimary.strong),
      ],
    );
  }
}
