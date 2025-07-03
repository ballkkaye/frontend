import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class HomeBoardContent extends StatelessWidget {
  const HomeBoardContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              '타이틀',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: MColor.kLabel.normal,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '게시글',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: MColor.kLabel.alternative,
              ),
            )
          ],
        ),
        Text(
          '16분전',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: MColor.kLabel.alternative,
          ),
        )
      ],
    );
  }
}
