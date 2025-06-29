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
        // TODO 통신 받을 때 for문 돌리기
        UserPredictionCard(
          leftTeamName: '롯데 자이언츠',
          leftScore: 3,
          rightTeamName: 'NC 다이노스',
          rightScore: 2,
          leftPercent: 30,
          rightPercent: 70,
          startHour: 16,
          startMinute: 20,
        ),
        UserPredictionCard(
          leftTeamName: '롯데 자이언츠',
          leftScore: 3,
          rightTeamName: 'NC 다이노스',
          rightScore: 2,
          leftPercent: 70,
          rightPercent: 30,
          startHour: 16,
          startMinute: 20,
        ),
        UserPredictionCard(
          leftTeamName: '롯데 자이언츠',
          leftScore: 3,
          rightTeamName: 'NC 다이노스',
          rightScore: 2,
          leftPercent: 30,
          rightPercent: 70,
          startHour: 16,
          startMinute: 20,
        ),
        UserPredictionCard(
          leftTeamName: '롯데 자이언츠',
          leftScore: 3,
          rightTeamName: 'NC 다이노스',
          rightScore: 2,
          leftPercent: 30,
          rightPercent: 70,
          startHour: 16,
          startMinute: 20,
        ),
        UserPredictionCard(
          leftTeamName: '롯데 자이언츠',
          leftScore: 3,
          rightTeamName: 'NC 다이노스',
          rightScore: 2,
          leftPercent: 30,
          rightPercent: 70,
          startHour: 16,
          startMinute: 20,
        ),
      ],
    );
  }
}
