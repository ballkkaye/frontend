import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class MatchupChart extends StatelessWidget {
  const MatchupChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: MColor.kLine.normal,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12), // 여기도 꼭 설정
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double parentWidth = constraints.maxWidth;
            double childMaxWidth = parentWidth * 0.14;
            double childMinWidth = parentWidth * 0.12;
            return Column(
              children: [
                MatchupChartHead(
                  childMinWidth: childMinWidth,
                  childMaxWidth: childMaxWidth,
                ),
                MatchupChartColumnList(
                  childMinWidth: childMinWidth,
                  childMaxWidth: childMaxWidth,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// 차트 헤더
class MatchupChartHead extends StatelessWidget {
  const MatchupChartHead({
    super.key,
    required this.childMinWidth,
    required this.childMaxWidth,
  });

  final double childMinWidth;
  final double childMaxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MColor.kFill.normal,
      child: Row(
        children: [
          MatchupBoldRow(
            title: '타순',
            childWidth: childMinWidth,
          ),
          MatchupBoldRow(
            title: '선수명',
            childWidth: childMaxWidth,
          ),
          MatchupBoldRow(
            title: '포지션',
            childWidth: childMaxWidth,
          ),
          MatchupBoldRow(
            title: '타수',
            childWidth: childMinWidth,
          ),
          MatchupBoldRow(
            title: '안타',
            childWidth: childMinWidth,
          ),
          MatchupBoldRow(
            title: '타율',
            childWidth: childMinWidth,
          ),
          MatchupBoldRow(
            title: 'OPS',
            childWidth: childMinWidth,
          ),
          MatchupBoldRow(
            title: '예측',
            childWidth: childMinWidth,
          ),
        ],
      ),
    );
  }
}

// 차트 컬럼 리스트
class MatchupChartColumnList extends StatelessWidget {
  const MatchupChartColumnList({
    super.key,
    required this.childMinWidth,
    required this.childMaxWidth,
  });

  final double childMinWidth;
  final double childMaxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TODO: 통신 받을 때 for문 돌리기
        MatchupChartColumn(
          childMinWidth: childMinWidth,
          childMaxWidth: childMaxWidth,
        ),
        MatchupChartColumn(
          childMinWidth: childMinWidth,
          childMaxWidth: childMaxWidth,
        ),
        MatchupChartColumn(
          childMinWidth: childMinWidth,
          childMaxWidth: childMaxWidth,
        ),
        MatchupChartColumn(
          childMinWidth: childMinWidth,
          childMaxWidth: childMaxWidth,
        ),
        MatchupChartColumn(
          childMinWidth: childMinWidth,
          childMaxWidth: childMaxWidth,
        ),
        MatchupChartColumn(
          childMinWidth: childMinWidth,
          childMaxWidth: childMaxWidth,
        ),
        MatchupChartColumn(
          childMinWidth: childMinWidth,
          childMaxWidth: childMaxWidth,
        ),
        MatchupChartColumn(
          childMinWidth: childMinWidth,
          childMaxWidth: childMaxWidth,
        ),
        MatchupChartColumn(
          childMinWidth: childMinWidth,
          childMaxWidth: childMaxWidth,
        ),
        // TODO: 마지막행은 border bottom 없음
        MatchChartLastColumn(
          childMinWidth: childMinWidth,
          childMaxWidth: childMaxWidth,
        ),
      ],
    );
  }
}

// 마지막 컬럼
class MatchChartLastColumn extends StatelessWidget {
  const MatchChartLastColumn({
    super.key,
    required this.childMinWidth,
    required this.childMaxWidth,
  });

  final double childMinWidth;
  final double childMaxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide.none,
        ),
      ),
      child: Row(
        children: [
          MatchupNormalRow(
            childWidth: childMinWidth,
            title: '1번',
          ),
          MatchupBoldRow(
            childWidth: childMaxWidth,
            title: '손호영',
          ),
          MatchupNormalRow(
            childWidth: childMaxWidth,
            title: '2루수',
          ),
          MatchupNormalRow(
            childWidth: childMinWidth,
            title: '3타수',
          ),
          MatchupNormalRow(
            childWidth: childMinWidth,
            title: '0안타',
          ),
          MatchupNormalRow(
            childWidth: childMinWidth,
            title: '0.000',
          ),
          MatchupNormalRow(
            childWidth: childMinWidth,
            title: '0.000',
          ),
          MatchupNormalRow(
            childWidth: childMinWidth,
            title: '12%',
          ),
        ],
      ),
    );
  }
}

// 컬럼
class MatchupChartColumn extends StatelessWidget {
  final double childMinWidth;
  final double childMaxWidth;

  const MatchupChartColumn({
    super.key,
    required this.childMinWidth,
    required this.childMaxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: MColor.kLine.normal),
        ),
      ),
      child: Row(
        children: [
          MatchupNormalRow(
            childWidth: childMinWidth,
            title: '1번',
          ),
          MatchupBoldRow(
            childWidth: childMaxWidth,
            title: '손호영',
          ),
          MatchupNormalRow(
            childWidth: childMaxWidth,
            title: '2루수',
          ),
          MatchupNormalRow(
            childWidth: childMinWidth,
            title: '3타수',
          ),
          MatchupNormalRow(
            childWidth: childMinWidth,
            title: '0안타',
          ),
          MatchupNormalRow(
            childWidth: childMinWidth,
            title: '0.000',
          ),
          MatchupNormalRow(
            childWidth: childMinWidth,
            title: '0.000',
          ),
          MatchupNormalRow(
            childWidth: childMinWidth,
            title: '12%',
          ),
        ],
      ),
    );
  }
}

// 얇은 글씨체 로우
class MatchupNormalRow extends StatelessWidget {
  final double childWidth;
  final String title;

  const MatchupNormalRow({
    super.key,
    required this.childWidth,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: childWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Center(
          child: MText.normal7_4(
            title,
            color: MColor.kLabel.normal,
          ),
        ),
      ),
    );
  }
}

// 두꺼운 글씨체 로우
class MatchupBoldRow extends StatelessWidget {
  final double childWidth;
  final String title;

  const MatchupBoldRow({
    super.key,
    required this.childWidth,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: childWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Center(
          child: MText.normal7_6(
            title,
            color: MColor.kLabel.normal,
          ),
        ),
      ),
    );
  }
}
