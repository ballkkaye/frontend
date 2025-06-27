import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/widgets/visit_record_list_body.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/widgets/visit_record_calendar.dart';
import 'package:flutter/material.dart';

class VisitRecordListPage extends StatelessWidget {
  const VisitRecordListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cellSize = screenWidth * (47 / 360); // 디자인 비율 반영

    return Scaffold(
      appBar: _appbar(context, cellSize),
      body: VisitRecordListBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/visit-record/detail");
        },
      ),
    );
  }

  AppBar _appbar(BuildContext context, cellSize) {
    return AppBar(
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      title: MText.h1("직관 기록"),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  child: VisitRecordCalendar(
                    cellSize: cellSize,
                    selectedDay: null,
                    focusedDay: DateTime.now(),
                    onDaySelected: (selected, focused) {
                      Navigator.pop(context); // 모달 닫고 경기 선택 페이지 열리도록
                      Future.microtask(() {
                        Navigator.pushNamed(
                          context,
                          '/visit-record/select',
                          arguments: selected, // 선택된 날짜 전달
                        );
                      });
                    },
                  ),
                );
              },
            );
          }, // TODO : 버튼 이동 수정
          icon: MIcon.nav.top.plus,
        ),
      ],
    );
  }
}
