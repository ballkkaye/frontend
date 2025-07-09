import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/visit_record_list_day_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/visit_record_list_month_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/widgets/visit_record_list_calendar.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/widgets/visit_record_list_game_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../visit_record_list_selected_date_vm.dart';

class VisitRecordListBody extends ConsumerWidget {
  const VisitRecordListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(VisitRecordListselectedDateProvider);
    final currentMonth = DateTime.now();
    final year = currentMonth.year;
    final month = currentMonth.month;

    final monthModel = ref.watch(VisitRecordListMonthProvider(VisitRecordParam(year: 2025, month: 7)));
    final dayModel = selectedDate != null ? ref.watch(VisitRecordListDayProvider("2025-07-09")) : null;

    if (monthModel == null || (selectedDate != null && dayModel == null)) {
      return const Center(child: CircularProgressIndicator());
    }

    final recordsToShow = (selectedDate == null ? monthModel : dayModel) as List<VisitRecordListDayModel>;

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
            (context, index) {
              final record = recordsToShow[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: VisitRecordListGameCard(record: record),
              );
            },
            childCount: recordsToShow.length,
          ),
        ),
      ],
    );
  }
}
