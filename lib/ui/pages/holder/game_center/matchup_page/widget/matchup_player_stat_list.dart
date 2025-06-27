import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class MatchupPlayerStatList extends StatelessWidget {
  const MatchupPlayerStatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            MatchupStatTitle(
              title: 'ERA',
            ),
            MatchupStatValue(
              value: 3.84,
            ),
          ],
        ),
        Row(
          children: [
            MatchupStatTitle(
              title: '경기',
            ),
            MatchupStatValue(
              value: 14,
            ),
          ],
        ),
        Row(
          children: [
            MatchupStatTitle(
              title: '결과',
            ),
            MatchupStatValue(
              value: '4승 1패 2무',
            ),
          ],
        ),
        Row(
          children: [
            MatchupStatTitle(
              title: 'QS',
            ),
            MatchupStatValue(
              value: 6,
            ),
          ],
        ),
        Row(
          children: [
            MatchupStatTitle(
              title: 'WHIP',
            ),
            MatchupStatValue(
              value: 1.32,
            ),
          ],
        ),
      ],
    );
  }
}

// 값 (3.84)
class MatchupStatValue extends StatelessWidget {
  final dynamic value;

  const MatchupStatValue({
    super.key,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '${value}',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: MColor.kLabel.normal,
      ),
    );
  }
}

// 타이틀 (ERA)
class MatchupStatTitle extends StatelessWidget {
  final String title;

  const MatchupStatTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '${title} : ',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: MColor.kLabel.normal,
      ),
    );
  }
}
