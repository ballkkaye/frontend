import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/ranking_page/ranking_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/ranking_page/widget/ranking_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RankingBody extends ConsumerWidget {
  const RankingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rankings = ref.watch(rankingProvider);
    if (rankings.isEmpty) {
      return CircularProgressIndicator(); // 또는 Center(child: Text("로딩 중"))
    }
    return Padding(
      padding: EdgeInsets.only(top: 22, left: 16, right: 16),
      child: Column(
        children: [
          MText.normal4_6(
            _formattedToday(),
            color: MColor.kLabel.normal,
          ),
          SizedBox(height: 16),
          RankingTable(rankings: rankings),
        ],
      ),
    );
  }
}

String _formattedToday() {
  final now = DateTime.now();
  const weekdays = ['월', '화', '수', '목', '금', '토', '일'];
  final weekday = weekdays[now.weekday - 1];
  return '${now.year}.${_twoDigits(now.month)}.${_twoDigits(now.day)} ($weekday)';
}

String _twoDigits(int n) => n.toString().padLeft(2, '0');
