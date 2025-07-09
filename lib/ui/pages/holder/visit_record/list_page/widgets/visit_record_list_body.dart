import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/visit_record_list_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/widgets/visit_record_list_calendar.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/widgets/visit_record_list_game_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../visit_record_list_selected_date_vm.dart';

class VisitRecordListBody extends ConsumerStatefulWidget {
  const VisitRecordListBody({super.key});

  @override
  ConsumerState<VisitRecordListBody> createState() => _VisitRecordListBodyState();
}

class _VisitRecordListBodyState extends ConsumerState<VisitRecordListBody> {
  late int _currentYear;
  late int _currentMonth;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _currentYear = now.year;
    _currentMonth = now.month;

    Future.microtask(() {
      ref.read(visitRecordListProvider.notifier).loadMonth(
            year: _currentYear,
            month: _currentMonth,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cellSize = screenWidth * (47 / 360); // 디자인 비율 반영
    final selectedDate = ref.watch(VisitRecordListselectedDateProvider);
    final records = ref.watch(visitRecordListProvider);

    return CustomScrollView(
      slivers: [
        // 캘린더
        SliverToBoxAdapter(
          child: Column(
            children: [
              VisitRecordListCalendar(
                cellSize: cellSize,
                onDateSelected: (date) {
                  if (!isSameDay(selectedDate, date)) {
                    ref.read(VisitRecordListselectedDateProvider.notifier).state = date;

                    final ymd = "${date!.year.toString().padLeft(4, '0')}-"
                        "${date.month.toString().padLeft(2, '0')}-"
                        "${date.day.toString().padLeft(2, '0')}";
                    ref.read(visitRecordListProvider.notifier).loadDay(ymd);
                  }
                },
                onMonthChanged: (year, month) {
                  _currentYear = year;
                  _currentMonth = month;

                  // 달을 넘기면 → 월별 조회 & 선택된 날짜 초기화
                  ref.read(VisitRecordListselectedDateProvider.notifier).state = null;
                  ref.read(visitRecordListProvider.notifier).loadMonth(
                        year: year,
                        month: month,
                      );
                },
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
        // 카드 리스트
        if (records == null)
          const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          )
        else
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final record = records[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: VisitRecordListGameCard(record: record),
                );
              },
              childCount: records.length,
            ),
          ),
      ],
    );
  }
}
