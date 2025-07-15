import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPredictionPage extends ConsumerWidget {
  const UserPredictionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userPredictionProvider);

    return Scaffold(
      appBar: _appbar(),
      body: switch (state) {
        BeforePrediction() ||
        AfterPrediction() =>
          UserPredictionBody(state: state!),
        null => const Center(child: CircularProgressIndicator()),
      },
    );
  }

  AppBar _appbar() {
    return AppBar(
      centerTitle: true,
      title: MText.h1('나의승부예측', color: MColor.kLabel.normal),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    );
  }
}
