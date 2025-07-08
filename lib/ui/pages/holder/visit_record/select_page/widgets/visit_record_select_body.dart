import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/select_page/visit_record_select_vm.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_date_picker.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_dropdown_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VisitRecordSelectBody extends ConsumerStatefulWidget {
  VisitRecordSelectBody({super.key});

  @override
  ConsumerState<VisitRecordSelectBody> createState() => _VisitRecordSelectBodyState();
}

class _VisitRecordSelectBodyState extends ConsumerState<VisitRecordSelectBody> {
  String? selectedDate;
  List<String> gameList = [];
  String? selectedGame;

  void _fetchGames(String date) async {
    setState(() {
      selectedDate = date;
    });

    final model = await ref.read(visitRecordSelectProvider(date).notifier).getModel(date);
    if (model != null) {
      setState(() {
        gameList = model.records.map((e) => '${e.homeTeamFullName} vs ${e.awayTeamFullName} (${e.stadiumShortName})').toList();
      });
    }
  }

  // List<String> games = [
  //   '두산 베어스 vs 롯데 자이언츠 (사직)',
  //   'SSG 랜더스 vs LG 트윈스 (잠실)',
  //   '삼성 라이온즈 vs 기아 타이거즈 (광주)',
  //   'KT 위즈 vs 한화 이글스 (대전)',
  //   'NC 다이노스 vs 키움 히어로즈 (고척)'
  // ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 22, horizontal: 16),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MText.h3_6("날짜 선택"),
            SizedBox(height: 10),
            // 날짜 선택 버튼
            MIconBtn(
              height: 49,
              icon: MIcon.page.record.calendarBlack,
              text: selectedDate ?? "날짜 선택",
              textColor: MColor.kLabel.normal,
              onPressed: () {
                // 날짜 선택 모달
                showModalBottomSheet(
                  backgroundColor: MColor.kBackground.normal,
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 250,
                      child: MDatePicker(
                        minimumDate: DateTime(2020, 3, 1),
                        maximumDate: DateTime.now(),
                        onDateTimeChanged: (value) {
                          final dateStr =
                              '${value.year.toString().padLeft(4, '0')}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}';
                          _fetchGames(dateStr);
                          Navigator.pop(context);
                          print("선택된 날짜: $dateStr");
                        },
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 16),
            MText.h3_6("경기 선택"),
            SizedBox(height: 10),
            // 경기 선택 버튼
            MDropdownBtn(
              hintText: '경기',
              items: gameList,
              value: selectedGame,
              onChanged: (value) {
                setState(() {
                  selectedGame = value;
                });
              },
            ),
            Spacer(),
            // 다음 버튼
            MElevatedBtn(
              text: '다음',
              onPressed: () {
                if (selectedDate != null && selectedGame != null) {
                  Navigator.pushNamed(
                    context,
                    "/visit-record/write",
                    arguments: {
                      "date": selectedDate,
                      "game": selectedGame,
                    },
                  );
                  // 넘기는 데이터 확인
                  print("date : $selectedDate");
                  print("game : $selectedGame");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
