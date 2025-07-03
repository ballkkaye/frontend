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
        Container(
          width: 280,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '타이틀길게길게길게길게길게길게길게길게길게',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: MColor.kLabel.normal,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(height: 8),
              Text(
                '게시글길게길게길게길게길게길게길게길게길게길게길게길게',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: MColor.kLabel.alternative,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
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
