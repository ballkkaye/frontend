import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_body.dart';
// import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_result_body.dart'; // 제거
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPredictionPage extends ConsumerWidget {
  const UserPredictionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPredictionModel = ref.watch(userPredictionProvider);
    final vm = ref.read(userPredictionProvider.notifier);

    if (userPredictionModel == null) {
      return Scaffold(
        appBar: _appbar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final bool allGamesCompleted = userPredictionModel.games
        .every((game) => game.game.gameStatus == "COMPLETED" || game.game.gameStatus == "CANCELED");

    // 예측 단계인지 (true) 결과 확인 단계인지 (false) 판단합니다.
    // 예측 제출 전이고, 모든 경기가 끝나지 않았다면 true
    final bool isPredictionPhase = !vm.isSubmitted && !allGamesCompleted;

    return Scaffold(
      appBar: _appbar(),
      // UserPredictionBody 위젯 하나만 사용하고 플래그를 전달합니다.
      body: UserPredictionBody(isPredictionPhase: isPredictionPhase),
    );
  }

  AppBar _appbar() {
    return AppBar(
      centerTitle: true,
      title: MText.h1('나의 승리 예측', color: MColor.kLabel.normal),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    );
  }
}
