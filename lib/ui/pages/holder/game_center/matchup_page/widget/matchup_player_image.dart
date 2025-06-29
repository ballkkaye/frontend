import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

Widget MatchupPlayerImage(String? imageUrl) {
  if (imageUrl == null || imageUrl.isEmpty) {
    return Center(
      child: Text(
        '이미지 준비중',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: MColor.kLabel.alternative,
        ),
      ),
    );
  } else {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }
}
