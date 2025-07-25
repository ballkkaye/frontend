import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class UserDetailStatusCard extends StatelessWidget {
  const UserDetailStatusCard({
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
      child:
          Center(child: MText.label1_5('나의 승리 예측 기반 뱃지 발급 준비 중', color: MColor.kLabel.alternative)),
    );
  }
}
