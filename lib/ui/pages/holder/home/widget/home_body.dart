import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_board.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_prediction.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_today_game.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_up_btn.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose(); // 메모리 누수 방지
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _scrollController,
      children: [
        SizedBox(height: 22),
        HomeTodayGame(),
        SizedBox(height: 56),
        HomePrediction(),
        SizedBox(height: 56),
        HomeBoard(),
        SizedBox(height: 32),
        HomeUpBtn(controller: _scrollController),
        SizedBox(height: 16),
      ],
    );
  }
}
