import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/ranking_page/widget/ranking_table.dart';
import 'package:flutter/material.dart';

class RankingBody extends StatelessWidget {
  const RankingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 22, left: 16, right: 16),
      child: Column(
        children: [
          MText.normal4_600(
            '2025.06.16 (목)',
            color: MColor.kLabel.normal,
          ),
          SizedBox(height: 16),
          RankingTable(),
        ],
      ),
    );
  }
}
