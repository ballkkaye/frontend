import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_body.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_result_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_prediction_vm.dart';

class UserPredictionPage extends ConsumerStatefulWidget {
  const UserPredictionPage({super.key});

  @override
  ConsumerState<UserPredictionPage> createState() => _UserPredictionPageState();
}

class _UserPredictionPageState extends ConsumerState<UserPredictionPage> {
  bool showResult = false;

  @override
  Widget build(BuildContext context) {
    final vm = ref.read(userPredictionProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text("나의 승부예측")),
      body: showResult
          ? const UserPredictionResultBody() // 경기후 예측 화면
          : const UserPredictionBody(),      // 경기전 예측 화면

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          vm.getAfterGamePrediction();
          setState(() {
            showResult = true;     //화면 전환
          });
        },
        child: const Icon(Icons.access_time),
        tooltip: "경기 결과 보기",
      ),
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
