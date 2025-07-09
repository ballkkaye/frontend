import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/visit_record_list.dart';
import 'package:flutter/material.dart';

class VisitRecordListGameCard extends StatelessWidget {
  final VisitRecordList record;

  const VisitRecordListGameCard({
    super.key,
    required this.record,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/visit-record/detail');
        },
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
                MText.normal1_7("${record.awayScore}", color: MColor.kLabel.disable),
                Column(
                  children: [
                    Row(
                      children: [
                        MText.h1(record.awayTeamName, color: MColor.kLabel.normal),
                        SizedBox(width: 16),
                        MText.normal7_6("vs", color: MColor.kLabel.alternative),
                        SizedBox(width: 16),
                        MText.h1(record.homeTeamName, color: MColor.kLabel.normal),
                      ],
                    ),
                    SizedBox(height: 8),
                    MText.normal8_5(record.gameDate, color: MColor.kLabel.alternative),
                    MText.normal8_5(record.stadiumName, color: MColor.kLabel.alternative),
                  ],
                ),
                MText.normal1_7("${record.homeScore}", color: MColor.kPrimary.strong),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
