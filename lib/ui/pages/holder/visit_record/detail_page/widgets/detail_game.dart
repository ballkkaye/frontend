import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class DetailGame extends StatelessWidget {
  const DetailGame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MText.normal1_700("0", color: MColor.kLabel.disable),
        Column(
          children: [
            Row(
              children: [
                MText.h1("한화", color: MColor.kLabel.normal),
                SizedBox(width: 16),
                MText.normal7_600("vs", color: MColor.kLabel.alternative),
                SizedBox(width: 16),
                MText.h1("키움", color: MColor.kLabel.normal),
              ],
            ),
            SizedBox(height: 8),
            MText.normal8_500("2025.06.22", color: MColor.kLabel.alternative),
            MText.normal8_500("대전한화생명이글스파크", color: MColor.kLabel.alternative),
          ],
        ),
        MText.normal1_700("5", color: MColor.kPrimary.strong),
      ],
    );
  }
}
