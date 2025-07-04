import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class UserMatchListCardHeader extends StatelessWidget {
  final String matchTitle;
  final String postedTime;

  const UserMatchListCardHeader({
    super.key,
    required this.matchTitle,
    required this.postedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MText.normal7_4(
          matchTitle,
          color: MColor.kLabel.alternative,
        ),
        MText.normal7_4(
          postedTime,
          color: MColor.kLabel.strong,
        ),
      ],
    );
  }
}
