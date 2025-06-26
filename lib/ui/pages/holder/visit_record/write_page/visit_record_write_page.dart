import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/widgets/visit_record_game.dart';
import 'package:flutter/material.dart';

class VisitRecordWritePage extends StatelessWidget {
  const VisitRecordWritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: MText.h1("기록 작성"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const VisitRecordGame(), // 점수, 팀명, 날짜, 경기장 표시 위젯
            const SizedBox(height: 20),

            // 사진 첨부 버튼
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: MIcon.page.record.camera,
                label: MText.button3("사진 첨부하기", color: MColor.kLabel.alternative),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(
                    color: MColor.kLine.normal,
                    width: 1,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 승/패 선택 버튼
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: MColor.kLine.normal),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: MColor.kPrimary.strong,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Center(
                        child: MText.button3("승", color: MColor.kLabel.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Center(
                        child: MText.button3("패", color: MColor.kLabel.disable),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 텍스트 입력창
            TextField(
              maxLines: 10,
              maxLength: 1000,
              decoration: InputDecoration(
                hintText: "경기 기록을 자유롭게 적어주세요",
                hintStyle: TextStyle(color: MColor.kLabel.disable),
                counterText: "0 / 1000",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 61,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: MColor.kPrimary.strong,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: MText.button2("완료", color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
