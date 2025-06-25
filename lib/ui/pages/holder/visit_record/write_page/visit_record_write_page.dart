import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class VisitRecordWritePage extends StatelessWidget {
  const VisitRecordWritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 10),
        title: MText.h1("직관 기록"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Card(),
            SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {},
              icon: MIcon.page.record.camera,
              label: Text("사진 첨부하기",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: MColor.kLabel.alternative),),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
