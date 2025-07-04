import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
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
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(color: MColor.kFill.normal, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: MText.label2_7("2025.06.19 롯데 자이언츠 vs 두산 베어스", color: MColor.kLabel.normal),
            ),
          ),
          SizedBox(height: 10),
          MText.normal6_700("2025년 06월 16일", color: MColor.kLabel.normal),
        ],
      ),
    );
  }
}
