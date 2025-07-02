import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_card_list.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:flutter/material.dart';

class UserPredictionBody extends StatelessWidget {
  const UserPredictionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 22,
            left: 16,
            right: 16,
          ),
          child: Column(
            children: [
              UserPredictionCardList(),
              SizedBox(height: 12),
              MElevatedBtn(
                text: '예측하기',
                isEnabled: false,
                onPressed: () {}, //isEnabled = false
              ),
            ],
          ),
        ),
      ],
    );
  }
}
