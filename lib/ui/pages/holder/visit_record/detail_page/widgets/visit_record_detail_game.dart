import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class VisitRecordDetailGame extends StatelessWidget {
  const VisitRecordDetailGame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("0",
            style:
                TextStyle(color: MColor.kLabel.disable, fontSize: 64, fontWeight: FontWeight.w700)),
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
            MText.label3("2025.06.22", color: MColor.kLabel.alternative),
            MText.label3("대전한화생명이글스파크", color: MColor.kLabel.alternative),
          ],
        ),
        Text("5",
            style: TextStyle(
                color: MColor.kPrimary.strong, fontSize: 64, fontWeight: FontWeight.w700)),
      ],
    );
  }
}
