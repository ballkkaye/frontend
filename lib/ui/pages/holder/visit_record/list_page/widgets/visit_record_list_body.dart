import 'package:ballkkaye_frontend/data/model/visit_record_list.dart';
import 'package:ballkkaye_frontend/data/param/visit_record_param.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/visit_record_list_day_vm.dart' hide VisitRecordListModel;
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/visit_record_list_month_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/widgets/visit_record_list_calendar.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/widgets/visit_record_list_game_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../visit_record_list_selected_date_vm.dart';

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
          child: Consumer(builder: (context, ref, _) {
            final selectedDate = ref.watch(VisitRecordListselectedDateProvider);
            return Column(
              children: [
                VisitRecordListCalendar(
                  cellSize: cellSize,
                  onDateSelected: (date) {
                    final current = ref.read(VisitRecordListselectedDateProvider);
                    if (!isSameDay(current, date)) {
                      ref.read(VisitRecordListselectedDateProvider.notifier).state = date;
                    }
                  },
                ),
                SizedBox(height: 12),
              ],
            );
          }),
        ),
        // 카드 리스트
        Consumer(builder: (context, ref, _) {
          final selectedDate = ref.watch(VisitRecordListselectedDateProvider);
          final currentMonth = DateTime.now();
          final year = currentMonth.year;
          final month = currentMonth.month;

          String _formatDate(DateTime date) {
            final y = date.year.toString().padLeft(4, '0');
            final m = date.month.toString().padLeft(2, '0');
            final d = date.day.toString().padLeft(2, '0');
            return '$y-$m-$d';
          }

          final monthModel = ref.watch(VisitRecordListMonthProvider(VisitRecordParam(year: year, month: month)));
          final dayModel = selectedDate != null ? ref.watch(VisitRecordListDayProvider(_formatDate(selectedDate))) : null;

          if (monthModel == null || (selectedDate != null && dayModel == null)) {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          }

          final List<VisitRecordList>? recordsToShow = selectedDate == null ? monthModel : dayModel;

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final record = recordsToShow[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: VisitRecordListGameCard(record: record),
                );
              },
              childCount: recordsToShow!.length,
            ),
          );
        })
      ],
    );
  }
}
