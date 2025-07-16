import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/_core/utils/m_util.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/visit_record_list_selected_date_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class VisitRecordListCalendar extends ConsumerStatefulWidget {
  const VisitRecordListCalendar(
      {super.key,
      required this.cellSize,
      this.onDateSelected,
      this.onMonthChanged});

  final double cellSize;
  final ValueChanged<DateTime?>? onDateSelected;
  final void Function(int year, int month)? onMonthChanged;

  @override
  ConsumerState<VisitRecordListCalendar> createState() =>
      _VisitRecordListCalendarState();
}

class _VisitRecordListCalendarState
    extends ConsumerState<VisitRecordListCalendar> {
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime(2025, 7, 17);
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(VisitRecordListselectedDateProvider);
    //final focusedDay = selectedDate ?? DateTime.now();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TableCalendar(
        rowHeight: widget.cellSize,
        // 각 날짜 셀의 높이
        daysOfWeekHeight: widget.cellSize * (2 / 3),
        // 요일(일~토) 셀의 높이
        locale: 'ko_KR',
        focusedDay: _focusedDay,
        firstDay: DateTime(2020, 3, 1),
        lastDay: DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
        onDaySelected: (selectedDay, focusedDay) {
          if (selectedDay.isAfter(today)) return;
          ref.read(VisitRecordListselectedDateProvider.notifier).state =
              selectedDay;
          setState(() {
            _focusedDay = focusedDay;
          });
          widget.onDateSelected?.call(selectedDay);
        },
        onPageChanged: (focusedDay) {
          setState(() {
            _focusedDay = focusedDay;
          });
          widget.onMonthChanged?.call(
            focusedDay.year,
            focusedDay.month,
          );
        },
        selectedDayPredicate: (day) => isSameDay(selectedDate, day),
        headerStyle: _headerStyle(),
        daysOfWeekStyle: _daysOfWeekStyle(),
        calendarStyle: _calendarStyle(),
        calendarBuilders: _calendarBuilders(),
      ),
    );
  }

// 캘린더 헤더 스타일 지정
  HeaderStyle _headerStyle() {
    return HeaderStyle(
      titleCentered: true,
      titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      formatButtonVisible: false,
      leftChevronIcon: Icon(CupertinoIcons.chevron_back),
      rightChevronIcon: Icon(CupertinoIcons.chevron_forward),
    );
  }

// 캘린더 요일(일~토) 스타일 지정
  DaysOfWeekStyle _daysOfWeekStyle() {
    return DaysOfWeekStyle(
      weekdayStyle: TextStyle(fontSize: 16, color: MColor.kLabel.neutral),
      weekendStyle: TextStyle(fontSize: 16, color: MColor.kLabel.neutral),
    );
  }

// 캘린더 내부 스타일 지정
  CalendarStyle _calendarStyle() {
    return CalendarStyle(
      outsideDaysVisible: false,
      defaultTextStyle: TextStyle(fontSize: 16, color: MColor.kLabel.neutral),
      weekendTextStyle: TextStyle(fontSize: 16, color: MColor.kLabel.neutral),
      todayTextStyle: TextStyle(fontSize: 16, color: MColor.kLabel.neutral),
      todayDecoration: const BoxDecoration(),
      selectedTextStyle: TextStyle(fontSize: 16, color: MColor.kLabel.white),
    );
  }

// 선택된 날짜 BoxDecoration
  CalendarBuilders<dynamic> _calendarBuilders() {
    return CalendarBuilders(
      selectedBuilder: (context, date, _) {
        return Center(
          child: SizedBox(
            width: widget.cellSize * 0.7,
            height: widget.cellSize * 0.7,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MColor.kPrimary.strong,
                borderRadius: BorderRadius.circular(8),
              ),
              child: MText.normal5_6(
                '${date.day}',
                color: MColor.kLabel.white,
              ),
            ),
          ),
        );
      },
      defaultBuilder: (context, date, _) {
        final isFuture = date.isAfter(today);
        final textColor =
            isFuture ? MColor.kLabel.disable : MColor.kLabel.neutral;

        return Center(
          child: MText.normal5_6(
            '${date.day}',
            color: textColor,
          ),
        );
      },
    );
  }
}
