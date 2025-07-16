import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_body.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_result_body.dart';
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
        appBar: _appbar(), // 앱바도 로딩 중일 때 표시
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final bool showResult = vm.isSubmitted;

    return Scaffold(
      appBar: _appbar(),
      body: showResult
          ? const UserPredictionResultBody() // 경기 후 예측 화면
          : const UserPredictionBody(), // 경기 전 예측 화면
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
