import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/_core/utils/m_util.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/ranking_page/ranking_vm.dart';
import 'package:flutter/material.dart';

class RankingTable extends StatelessWidget {
  final List<RankingModel> rankings;
  const RankingTable({
    required this.rankings,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: MColor.kLine.normal),
      ),
      clipBehavior: Clip.antiAlias,
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(32),
          1: FlexColumnWidth(),
          2: FixedColumnWidth(28),
          3: FixedColumnWidth(28),
          4: FixedColumnWidth(28),
          5: FixedColumnWidth(28),
          6: FixedColumnWidth(42),
          7: FixedColumnWidth(34),
          8: FixedColumnWidth(68),
          9: FlexColumnWidth(),
        },
        children: [
          TableRow(
              decoration: BoxDecoration(
                color: MColor.kFill.normal,
              ),
              children: [
                RankingHeadRow(value: '순위'),
                RankingHeadRow(value: '팀명'),
                RankingHeadRow(value: '경기'),
                RankingHeadRow(value: '승'),
                RankingHeadRow(value: '패'),
                RankingHeadRow(value: '무'),
                RankingHeadRow(value: '승률'),
                RankingHeadRow(value: '게임차'),
                RankingHeadRow(value: '최근10경기'),
                RankingHeadRow(value: '연속'),
              ]),
          ...rankings.map((ranking) => _rankingConRow([
                '${ranking.teamRank}',
                shortenTeamName(ranking.teamName),
                '${ranking.totalGame}',
                '${ranking.winGame}',
                '${ranking.loseGame}',
                '${ranking.tieGame}',
                '${ranking.winRate}',
                '${ranking.gap}',
                ranking.recentTenGame,
                ranking.streak,
              ])),
        ],
      ),
    );
  }

  TableRow _rankingConRow(List<String> values) {
    return TableRow(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: MColor.kLine.normal)),
      ),
      children: values.map((value) => RankingContentRow(value: value)).toList(),
    );
  }
}

class RankingContentRow extends StatelessWidget {
  final String? value;

  const RankingContentRow({
    super.key,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        '$value',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}

class RankingHeadRow extends StatelessWidget {
  final String value;

  const RankingHeadRow({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: MText.normal8_6(
          value,
          color: MColor.kLabel.normal,
        ),
      ),
    );
  }
}
