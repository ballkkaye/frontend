import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_board.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_prediction.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_today_game.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_up_btn.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HomeTodayGame(),
        SizedBox(height: 56),
        HomePrediction(),
        SizedBox(height: 56),
        HomeBoard(),
        SizedBox(height: 32),
        HomeUpBtn(),
        SizedBox(height: 16),
      ],
    );
  }
}
