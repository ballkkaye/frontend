import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class RankingTable extends StatelessWidget {
  const RankingTable({
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
          0: FixedColumnWidth(26),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
          3: FixedColumnWidth(26),
          4: FixedColumnWidth(26),
          5: FixedColumnWidth(26),
          6: FixedColumnWidth(46),
          7: FixedColumnWidth(42),
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
          _rankingConRow([
            '1',
            'SSG',
            '68',
            '41',
            '27',
            '1',
            '0.603',
            '0',
            '16승1무3패',
            '4승',
          ]),
          _rankingConRow([
            '1',
            '한화',
            '68',
            '41',
            '27',
            '1',
            '0.603',
            '0',
            '6승1무3패',
            '4승',
          ]),
          _rankingConRow([
            '1',
            '한화',
            '68',
            '41',
            '27',
            '1',
            '0.603',
            '0',
            '6승1무3패',
            '4승',
          ]),
          _rankingConRow([
            '1',
            '한화',
            '68',
            '41',
            '27',
            '1',
            '0.603',
            '0',
            '6승1무3패',
            '4승',
          ]),
          _rankingConRow([
            '1',
            '한화',
            '68',
            '41',
            '27',
            '1',
            '0.603',
            '0',
            '6승1무3패',
            '4승',
          ]),
          _rankingConRow([
            '1',
            '한화',
            '68',
            '41',
            '27',
            '1',
            '0.603',
            '0',
            '6승1무3패',
            '4승',
          ]),
          _rankingConRow([
            '1',
            '한화',
            '68',
            '41',
            '27',
            '1',
            '0.603',
            '0',
            '6승1무3패',
            '4승',
          ]),
          _rankingConRow([
            '1',
            '한화',
            '68',
            '41',
            '27',
            '1',
            '0.603',
            '0',
            '6승1무3패',
            '4승',
          ]),
          _rankingConRow([
            '1',
            '한화',
            '68',
            '41',
            '27',
            '1',
            '0.603',
            '0',
            '6승1무3패',
            '4승',
          ]),
          _rankingConRow([
            '1',
            '한화',
            '68',
            '41',
            '27',
            '1',
            '0.603',
            '0',
            '6승1무3패',
            '4승',
          ]),
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
        child: MText.normal8_600(
          value,
          color: MColor.kLabel.normal,
        ),
      ),
    );
  }
}
