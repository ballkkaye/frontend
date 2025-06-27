import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/matchup_page/widget/matchup_body.dart';
import 'package:flutter/material.dart';

class MatchupPage extends StatelessWidget {
  const MatchupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: MatchupBody(),
    );
  }

  AppBar _appbar() {
    return AppBar(
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: MText.h1('상대전적확인'),
      ),
    );
  }
}
