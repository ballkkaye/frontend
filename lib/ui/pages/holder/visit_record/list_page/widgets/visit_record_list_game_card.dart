import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/visit_record_list_vm.dart';
import 'package:flutter/material.dart';

class VisitRecordListGameCard extends StatelessWidget {
  final VisitRecordListModel record;

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
          print("레코드가 무엇이냐 : ${record}");
          Navigator.pushNamed(context, "/visit-record/detail", arguments: record.id);
          print("직관기록 ID : ${record.id}");
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
                        MText.h1(record.awayTeamName?.toString() ?? "-", color: MColor.kLabel.normal),
                        SizedBox(width: 16),
                        MText.normal7_6("vs", color: MColor.kLabel.alternative),
                        SizedBox(width: 16),
                        MText.h1(record.homeTeamName?.toString() ?? "-", color: MColor.kLabel.normal),
                      ],
                    ),
                    SizedBox(height: 8),
                    MText.normal8_5(record.gameDate?.toString() ?? "-", color: MColor.kLabel.alternative),
                    MText.normal8_5(record.stadiumName?.toString() ?? "-", color: MColor.kLabel.alternative),
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
