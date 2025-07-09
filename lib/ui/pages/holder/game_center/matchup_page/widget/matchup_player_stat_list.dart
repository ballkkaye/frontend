import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class MatchupPlayerStatList extends StatelessWidget {
  final int gameCount;
  final String result;
  final double era;
  final double whip;
  final int qs;
  const MatchupPlayerStatList({
    super.key,
    required this.gameCount,
    required this.result,
    required this.era,
    required this.whip,
    required this.qs,
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
              value: era,
            ),
          ],
        ),
        Row(
          children: [
            MatchupStatTitle(
              title: '경기',
            ),
            MatchupStatValue(
              value: gameCount,
            ),
          ],
        ),
        Row(
          children: [
            MatchupStatTitle(
              title: '결과',
            ),
            MatchupStatValue(
              value: result,
            ),
          ],
        ),
        Row(
          children: [
            MatchupStatTitle(
              title: 'QS',
            ),
            MatchupStatValue(
              value: qs,
            ),
          ],
        ),
        Row(
          children: [
            MatchupStatTitle(
              title: 'WHIP',
            ),
            MatchupStatValue(
              value: whip,
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
    return MText.normal5_4(
      '${value}',
      color: MColor.kLabel.normal,
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
    return MText.normal5_4(
      '${title} : ',
      color: MColor.kLabel.normal,
    );
  }
}
