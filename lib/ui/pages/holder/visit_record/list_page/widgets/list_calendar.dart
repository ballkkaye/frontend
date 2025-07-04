import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

class ListCalendar extends StatefulWidget {
  const ListCalendar({super.key, required this.cellSize});

  final double cellSize;

  @override
  State<ListCalendar> createState() => _ListCalendarState();
}

class _ListCalendarState extends State<ListCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
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
        lastDay: DateTime(_focusedDay.year, _focusedDay.month + 1, 0),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            if (DateTime(selectedDay.year, selectedDay.month, selectedDay.day)
                .isAfter(DateTime(focusedDay.year, focusedDay.month, focusedDay.day))) return; // 오늘 이후 날짜 선택 차단
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
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
              child: MText.normal5_600(
                '${date.day}',
                color: MColor.kLabel.white,
              ),
            ),
          ),
        );
      },
      defaultBuilder: (context, date, _) {
        final isFuture = date.isAfter(DateTime.now());
        final textColor = isFuture ? MColor.kLabel.disable : MColor.kLabel.neutral;

        return Center(
          child: MText.normal5_600(
            '${date.day}',
            color: textColor,
          ),
        );
      },
    );
  }
}
