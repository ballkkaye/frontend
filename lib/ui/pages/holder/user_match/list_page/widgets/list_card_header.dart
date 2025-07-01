import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class ListCardHeader extends StatelessWidget {
  final String matchTitle;
  final String postedTime;

  const ListCardHeader({
    super.key,
    required this.matchTitle,
    required this.postedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          matchTitle,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: MColor.kLabel.alternative,
          ),
        ),
        Text(
          postedTime,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: MColor.kLabel.strong,
          ),
        ),
      ],
    );
  }
}
