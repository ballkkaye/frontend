import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class WriteCalendarBottomSheet extends StatefulWidget {
  final void Function(DateTime) onDateSelected;

  const WriteCalendarBottomSheet({required this.onDateSelected});

  @override
  _WriteCalendarBottomSheetState createState() =>
      _WriteCalendarBottomSheetState();
}

class _WriteCalendarBottomSheetState extends State<WriteCalendarBottomSheet> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(width: 16),
              IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  size: 24, // 아이콘 크기 작게
                  color: Colors.black,
                ),
                style: IconButton.styleFrom(
                  padding: EdgeInsets.all(1),
                  // 아이콘과 원 사이 간격 좁게
                  minimumSize: Size(24, 24),
                  // 전체 버튼 크기 (지름 줄이기)
                  shape: CircleBorder(),
                  side: BorderSide(color: Colors.black, width: 1.5),
                  backgroundColor: Colors.transparent,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // 클릭 영역도 줄이기
                ),
                onPressed: () {
                  setState(() {
                    focusedDay =
                        DateTime(focusedDay.year, focusedDay.month - 1);
                  });
                },
              ),
              Spacer(),
              Text(
                DateFormat('yyyy.MM').format(focusedDay),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              // 오른쪽 화살표
              IconButton(
                icon: Icon(
                  Icons.chevron_right,
                  size: 24, // 아이콘 크기 작게
                  color: Colors.black,
                ),
                style: IconButton.styleFrom(
                  padding: EdgeInsets.all(1),
                  // 아이콘과 원 사이 간격 좁게
                  minimumSize: Size(24, 24),
                  // 전체 버튼 크기 (지름 줄이기)
                  shape: CircleBorder(),
                  side: BorderSide(color: Colors.black, width: 1.5),
                  backgroundColor: Colors.transparent,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // 클릭 영역도 줄이기
                ),
                onPressed: () {
                  setState(() {
                    focusedDay =
                        DateTime(focusedDay.year, focusedDay.month + 1);
                  });
                },
              ),
              SizedBox(width: 16),
            ],
          ),

          SizedBox(height: 32),
          Row(
            children: [
              Text(
                "날짜를 선택해주세요",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: 16),

          SizedBox(
            height: 360,
            child: TableCalendar(
              locale: 'ko_KR',
              firstDay: DateTime(2020),
              lastDay: DateTime(2030),
              focusedDay: focusedDay,
              selectedDayPredicate: (day) =>
                  selectedDay != null && isSameDay(selectedDay, day),
              onDaySelected: (selected, focused) {
                setState(() {
                  selectedDay = selected;
                  focusedDay = focused;
                });
              },
              headerVisible: false,
              startingDayOfWeek: StartingDayOfWeek.sunday,
              calendarStyle: CalendarStyle(
                isTodayHighlighted: false,

                // 선택된 날짜
                selectedDecoration: BoxDecoration(
                  color: Color(0xFF17C3B2),
                  borderRadius: BorderRadius.circular(6),
                ),
                selectedTextStyle: TextStyle(color: Colors.white),

                // 오늘 날짜 스타일 제거
                todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                ),

                // 기본/주말/비활성 날짜 모두 명시
                defaultDecoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                weekendDecoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                outsideDecoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                disabledDecoration: BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.black),
                weekendStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),

          SizedBox(height: 20),

          // 적용 버튼
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: selectedDay != null
                  ? () {
                      Navigator.pop(context, selectedDay);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF17C3B2),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text("적용"),
            ),
          ),
        ],
      ),
    );
  }
}
