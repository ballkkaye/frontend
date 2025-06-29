import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_card.dart';
import 'package:flutter/material.dart';

class UserPredictionCardList extends StatelessWidget {
  const UserPredictionCardList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserPredictionCard(
          leftTeamName: '롯데 자이언츠',
          leftScore: 3,
          rightTeamName: 'NC 다이노스',
          rightScore: 2,
          leftPercent: 30,
          rightPercent: 70,
        ),
        UserPredictionCard(
          leftTeamName: '롯데 자이언츠',
          leftScore: 3,
          rightTeamName: 'NC 다이노스',
          rightScore: 2,
          leftPercent: 70,
          rightPercent: 30,
        ),
        UserPredictionCard(
          leftTeamName: '롯데 자이언츠',
          leftScore: 3,
          rightTeamName: 'NC 다이노스',
          rightScore: 2,
          leftPercent: 30,
          rightPercent: 70,
        ),
        UserPredictionCard(
          leftTeamName: '롯데 자이언츠',
          leftScore: 3,
          rightTeamName: 'NC 다이노스',
          rightScore: 2,
          leftPercent: 30,
          rightPercent: 70,
        ),
        UserPredictionCard(
          leftTeamName: '롯데 자이언츠',
          leftScore: 3,
          rightTeamName: 'NC 다이노스',
          rightScore: 2,
          leftPercent: 30,
          rightPercent: 70,
        ),
      ],
    );
  }
}
