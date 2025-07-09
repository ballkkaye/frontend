import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/matchup_page/matchup_vm.dart';
import 'package:flutter/material.dart';

class MatchupChart extends StatelessWidget {
  final List<Hitter> hitters;
  const MatchupChart({
    super.key,
    required this.hitters,
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
                  hitters: hitters,
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
    required this.hitters,
  });

  final double childMinWidth;
  final double childMaxWidth;
  final List<Hitter> hitters;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hitters.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final hitter = hitters[index];
        return MatchupChartColumn(
          childMinWidth: childMinWidth,
          childMaxWidth: childMaxWidth,
          hitterOrder: hitter.hitterOrder,
          hitPredictionPer: hitter.hitPredictionPer,
          name: hitter.name,
          position: hitter.position,
          ab: hitter.ab,
          h: hitter.h,
          avg: hitter.avg,
          ops: hitter.ops,
          isLast: index == hitters.length - 1, // 마지막인지 확인
        );
      },
    );
  }
}

// 컬럼
class MatchupChartColumn extends StatelessWidget {
  final double childMinWidth;
  final double childMaxWidth;
  final int hitterOrder;
  final double hitPredictionPer;
  final String name;
  final String position;
  final int ab;
  final int h;
  final double avg;
  final double ops;
  final bool isLast;

  const MatchupChartColumn({
    super.key,
    required this.childMinWidth,
    required this.childMaxWidth,
    required this.hitterOrder,
    required this.hitPredictionPer,
    required this.name,
    required this.position,
    required this.ab,
    required this.h,
    required this.avg,
    required this.ops,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: isLast ? BorderSide.none : BorderSide(color: MColor.kLine.normal),
        ),
      ),
      child: Row(
        children: [
          MatchupNormalRow(
            childWidth: childMinWidth,
            title: '${hitterOrder}번',
          ),
          MatchupBoldRow(
            childWidth: childMaxWidth,
            title: name,
          ),
          MatchupNormalRow(
            childWidth: childMaxWidth,
            title: position,
          ),
          MatchupNormalRow(
            childWidth: childMinWidth,
            title: '${ab}타수',
          ),
          MatchupNormalRow(
            childWidth: childMinWidth,
            title: '${h}안타',
          ),
          MatchupNormalRow(
            childWidth: childMinWidth,
            title: '${avg}',
          ),
          MatchupNormalRow(
            childWidth: childMinWidth,
            title: '${ops}',
          ),
          MatchupNormalRow(
            childWidth: childMinWidth,
            title: '${hitPredictionPer}%',
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
