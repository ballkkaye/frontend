import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class VisitRecordListPage extends StatelessWidget {
  const VisitRecordListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TableCalendar(
              locale: 'ko_KR',
              focusedDay: DateTime.now(),
              firstDay: DateTime(2020, 3, 1),
              lastDay: DateTime(DateTime.now().year + 1, 12, 31),
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                leftChevronIcon: Icon(CupertinoIcons.chevron_back),
                rightChevronIcon: Icon(CupertinoIcons.chevron_forward),
              ),
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                defaultTextStyle: TextStyle(fontSize: 14, color: Colors.grey), // 평일 날짜 숫자
                weekendTextStyle: TextStyle(fontSize: 14, color: Colors.grey), // 주말 날짜 숫자
                todayTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ), // 오늘 날짜
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(fontSize: 12), // 요일 스타일 조정
                weekendStyle: TextStyle(fontSize: 12), // 주말 요일도 동일하게
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 5),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shadowColor: Colors.black26,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("0", style: TextStyle(color: Colors.grey, fontSize: 64)),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "한화",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                                  ),
                                  SizedBox(width: 16),
                                  Text("vs", style: TextStyle(fontSize: 12)),
                                  SizedBox(width: 16),
                                  Text(
                                    "키움",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                "2025.06.22",
                                style: TextStyle(color: Colors.grey, fontSize: 11),
                              ),
                              Text(
                                "대전한화생명이글스파크",
                                style: TextStyle(color: Colors.grey, fontSize: 11),
                              ),
                            ],
                          ),
                          Text("5", style: TextStyle(fontSize: 64)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: Text("직관 기록"), // TODO : 텍스트 스타일 수정
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {}, // TODO : 버튼 이동 수정
          icon: MIcon.nav.top.plus,
        ),
      ],
    );
  }
}
