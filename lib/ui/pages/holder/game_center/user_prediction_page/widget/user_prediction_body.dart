import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_card_list.dart';
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
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 61),
                  foregroundColor: MColor.kPrimary.normal,
                  backgroundColor: MColor.kPrimary.strong,
                  side: BorderSide.none,
                ),
                child: MText.button2(
                  '상대 전적 확인',
                  color: MColor.kLabel.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
