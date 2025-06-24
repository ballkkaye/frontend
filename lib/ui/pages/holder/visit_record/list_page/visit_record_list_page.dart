import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
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
              rowHeight: 60,
              daysOfWeekHeight: 60,
              locale: 'ko_KR',
              focusedDay: DateTime.now(),
              firstDay: DateTime(2020, 3, 1),
              lastDay: DateTime(DateTime.now().year + 1, 12, 31),
              headerStyle: HeaderStyle(
                titleCentered: true,
                titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                formatButtonVisible: false,
                leftChevronIcon: Icon(CupertinoIcons.chevron_back),
                rightChevronIcon: Icon(CupertinoIcons.chevron_forward),
              ),
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                defaultTextStyle: TextStyle(fontSize: 16, color: MColor.kLabel.disable),
                weekendTextStyle: TextStyle(fontSize: 16, color: MColor.kLabel.disable),
                todayTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: MColor.kLabel.white,
                ), // 오늘 날짜
                todayDecoration: BoxDecoration(
                  color: MColor.kPrimary.strong,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
                selectedDecoration: BoxDecoration(
                  color: MColor.kPrimary.strong,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
                selectedTextStyle: TextStyle(fontSize: 16, color: MColor.kLabel.white),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(fontSize: 16, color: MColor.kLabel.neutral),
                weekendStyle: TextStyle(fontSize: 16, color: MColor.kLabel.neutral),
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 5),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    shadowColor: Colors.black26,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("0", style: TextStyle(color: Colors.grey, fontSize: 64, fontWeight: FontWeight.w700)),
                          Column(
                            children: [
                              Row(
                                children: [
                                  MText.h1("한화", color: MColor.kLabel.normal),
                                  SizedBox(width: 16),
                                  MText.label2_5("vs", color: MColor.kLabel.normal),
                                  SizedBox(width: 16),
                                  MText.h1("키움", color: MColor.kLabel.normal),
                                ],
                              ),
                              SizedBox(height: 8),
                              MText.label3("2025.06.22",color: MColor.kLabel.alternative),
                              MText.label3("대전한화생명이글스파크",color: MColor.kLabel.alternative),
                            ],
                          ),
                          Text("5", style: TextStyle(color: Colors.black, fontSize: 64, fontWeight: FontWeight.w700)),
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
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, "/visitrecord/write");
      }),
    );
  }

  AppBar _appbar() {
    return AppBar(
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      title: MText.h1("직관 기록"),
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
