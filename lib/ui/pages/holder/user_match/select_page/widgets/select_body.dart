import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/_core/utils/m_util.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_date_select_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_dropdown_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:flutter/material.dart';

class SelectBody extends StatelessWidget {
  SelectBody({super.key});
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
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MText.h3_6("날짜 선택"),
            SizedBox(height: 10),
            // 날짜 선택 버튼
            MDateSelectBtn(
              text: '2025.06.27',
              minimumDate: today, // 최소 오늘
              maximumDate:
                  DateTime(DateTime.now().year + 1, DateTime.now().month + 1, 0), // 최대 일년 뒤
              onDateTimeChanged: (value) {
                // TODO : 날짜 선택해서 들어온 값 value -> text로 들어가도록 하면 됨
              },
            ),
            SizedBox(height: 16),
            MText.h3_6("경기 선택"),
            SizedBox(height: 10),
            // 경기 선택 버튼
            MDropdownBtn(
              hintText: '경기',
              items: games,
              onChanged: (value) {},
            ),
            Spacer(),
            // 다음 버튼
            MElevatedBtn(
              text: '다음',
              onPressed: () {
                Navigator.pushNamed(context, "/user-match/write");
              },
            ),
          ],
        ),
      ),
    );
  }
}
