import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/widgets/list_calendar.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/widgets/list_game_card.dart';
import 'package:flutter/material.dart';

// ListBody 이미 존재 -> 도메인명+페이지명으로 변경
class VisitRecordListBody extends StatelessWidget {
  const VisitRecordListBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cellSize = screenWidth * (47 / 360); // 디자인 비율 반영
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          // 캘린더
          SliverToBoxAdapter(
            child: ListCalendar(cellSize: cellSize),
          ),
          // 카드 리스트
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 5), // 카드 리스트 아래 여백
                child: ListGameCard(),
              ),
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
