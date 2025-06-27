import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/widgets/visit_record_icon_btn.dart';
import 'package:flutter/material.dart';

class VisitRecordSelectPage extends StatelessWidget {
  VisitRecordSelectPage({super.key});
  String selectedGame = '두산 베어스 vs 롯데 자이언츠(사직)';
  final List<String> games = const [
    '두산 베어스 vs 롯데 자이언츠(사직)',
    'SSG 랜더스 vs LG 트윈스 (잠실)',
    '삼성 라이온즈 vs 기아 타이거즈 (광주)',
    'KT 위즈 vs 한화 이글스 (대전)',
    'NC 다이노스 vs 키움 히어로즈 (고척)'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Padding(
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
              },
            ),
            SizedBox(height: 16),
            MText.h3_6("경기 선택"),
            SizedBox(height: 10),
            // 경기 선택 버튼
            DropdownButtonFormField<String>(
              value: selectedGame,
              hint: const Text('경기'),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              ),
              isExpanded: true,
              onChanged: null, // 아직은 상태 관리 안 함
              items: games.map((game) {
                return DropdownMenuItem(
                  value: game,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          game,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/visit-record/write");
        },
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      title: MText.h1("직관 기록 작성"),
      centerTitle: true,
    );
  }
}
