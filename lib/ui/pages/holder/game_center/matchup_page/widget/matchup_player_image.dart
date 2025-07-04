import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

Widget MatchupPlayerImage(String? imageUrl) {
  if (imageUrl == null || imageUrl.isEmpty) {
    return Center(
      child: MText.normal6_6(
        '이미지 준비중',
        color: MColor.kLabel.alternative,
      ),
    );
  } else {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }
}
