import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text("2025.06.19 롯데 자이언츠 vs 두산 베어스",
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600, color: MColor.kLabel.normal))),
          SizedBox(height: 10),
          Center(
              child: Text("2025년 06월 16일",
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400, color: MColor.kLabel.normal))),
        ],
      ),
    );
  }
}
