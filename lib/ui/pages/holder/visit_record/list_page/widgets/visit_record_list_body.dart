import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/widgets/list_calendar.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/widgets/list_game_card.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/widgets/visit_record_list_calendar.dart';
import 'package:flutter/material.dart';

class VisitRecordListBody extends StatelessWidget {
  const VisitRecordListBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cellSize = screenWidth * (47 / 360); // 디자인 비율 반영
    return CustomScrollView(
      slivers: [
        // 캘린더
        SliverToBoxAdapter(
          child: Column(
            children: [
              VisitRecordListCalendar(cellSize: cellSize),
              SizedBox(height: 12),
            ],
          ),
        ),
        // 카드 리스트
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: VisitRecordListGameCard(),
            ),
            childCount: 5,
          ),
        ),
      ],
    );
  }
}
