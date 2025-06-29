import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/select_page/widgets/select_dropdown_btn.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/widgets/visit_record_btn.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/widgets/visit_record_icon_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectBody extends StatelessWidget {
  SelectBody({super.key});
  String selectedGame = '두산 베어스 vs 롯데 자이언츠 (사직)';
  List<String> games = [
    '두산 베어스 vs 롯데 자이언츠 (사직)',
    'SSG 랜더스 vs LG 트윈스 (잠실)',
    '삼성 라이온즈 vs 기아 타이거즈 (광주)',
    'KT 위즈 vs 한화 이글스 (대전)',
    'NC 다이노스 vs 키움 히어로즈 (고척)'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 22, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MText.h3_6("날짜 선택"),
          SizedBox(height: 10),
          // 날짜 선택 버튼
          VisitRecordIconBtn(
            icon: MIcon.page.record.calendarBlack,
            text: "2025.06.27",
            color: MColor.kLabel.normal,
            onPressed: () {
              print("날짜 선택됨");
              // 날짜 선택 모달
              _showCupertinoModalPopup(context);
            },
          ),
          SizedBox(height: 16),
          MText.h3_6("경기 선택"),
          SizedBox(height: 10),
          // 경기 선택 버튼
          SelectDropdownBtn(selectedGame: selectedGame, games: games),
          Spacer(),
          // 다음 버튼
          VisitRecordBtn(
            text: "다음",
            onPressed: () {
              Navigator.pushNamed(context, "/visit-record/write");
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> _showCupertinoModalPopup(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: 250,
        color: Colors.white,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: DateTime.now(),
          minimumDate: DateTime(2020, 3, 1),
          maximumDate: DateTime.now(),
          onDateTimeChanged: (value) {
            print("선택된 날짜: $value");
            // TODO : 상태 관리
          },
        ),
      ),
    );
  }
}
