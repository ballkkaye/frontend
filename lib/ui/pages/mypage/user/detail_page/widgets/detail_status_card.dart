import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class DetailStatusCard extends StatelessWidget {
  const DetailStatusCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: MColor.kShadow.normal),
      child: Center(
          child: MText.label1_5('내 예측 결과 혹은 뱃지/점수 시스템 영역', color: MColor.kLabel.alternative)),
    );
  }
}
