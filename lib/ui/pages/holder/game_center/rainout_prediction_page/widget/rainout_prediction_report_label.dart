import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class RainoutPredictionReportLabel extends StatelessWidget {
  const RainoutPredictionReportLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Container(
            child: MIcon.page.rainout.sRain,
          ),
          SizedBox(width: 6),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Color(0x19FF4747),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: MText.label1_5(
              '우천취소 가능성 높음',
              color: MColor.kStatus.negative,
            ),
          ),
        ],
      ),
    );
  }
}
