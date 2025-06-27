import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

class VisitRecordCalendar extends StatelessWidget {
  const VisitRecordCalendar({
    super.key,
    required this.cellSize,
    required this.selectedDay,
    required this.focusedDay,
    required this.onDaySelected,
  });

  final double cellSize;
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final void Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      rowHeight: cellSize,
      daysOfWeekHeight: cellSize * (2 / 3),
      locale: 'ko_KR',
      focusedDay: focusedDay,
      firstDay: DateTime(2020, 3, 1),
      lastDay: DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
      onDaySelected: (selected, focused) {
        if (selected.isAfter(DateTime.now())) return;
        onDaySelected(selected, focused);
      },
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      headerStyle: _headerStyle(),
      daysOfWeekStyle: _daysOfWeekStyle(),
      calendarStyle: _calendarStyle(),
      calendarBuilders: _calendarBuilders(cellSize),
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
      todayDecoration: const BoxDecoration(),
      selectedTextStyle: TextStyle(fontSize: 16, color: MColor.kLabel.white),
      todayTextStyle: TextStyle(fontSize: 16, color: MColor.kLabel.neutral),
    );
  }

  // 선택된 날짜 BoxDecoration
  CalendarBuilders<dynamic> _calendarBuilders(double cellSize) {
    return CalendarBuilders(
      selectedBuilder: (context, date, _) {
        return Center(
          child: SizedBox(
            width: cellSize * 0.7,
            height: cellSize * 0.7,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MColor.kPrimary.strong,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${date.day}',
                style: TextStyle(fontSize: 16, color: MColor.kLabel.white),
              ),
            ),
          ),
        );
      },
      defaultBuilder: (context, date, _) {
        final isFuture = date.isAfter(DateTime.now());
        final textColor = isFuture ? MColor.kLabel.disable : MColor.kLabel.neutral;

        return Center(
          child: Text(
            '${date.day}',
            style: TextStyle(fontSize: 16, color: textColor),
          ),
        );
      },
    );
  }
}
