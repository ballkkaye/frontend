import 'package:ballkkaye_frontend/data/repository/game_center_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_fm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPredictionVM {
  final WidgetRef ref;
  final mContext = navigatorKey.currentContext!;

  UserPredictionVM(this.ref);

  /// 1. 최초 진입 시 데이터 불러오기
  Future<void> init() async {
    final data = await GameCenterRepository().getUserPrediction();
    if (data["status"] != 200) {
      _showSnack("예측 조회 실패: ${data["msg"]}");
    } else {
      ref.read(userPredictionProvider.notifier).setPredictionData(data["body"]);
    }
  }

  /// 6. 경기후 내가 선택한 예측상태 반영
  Future<void> getAfterGamePrediction() async {
    final response = await GameCenterRepository().getMyPredictionTest();
    final fm = ref.read(userPredictionProvider.notifier);

    if (response["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("예측 결과 불러오기 실패: ${response["msg"]}")),
      );
    } else {
      fm.setPredictionData(response["body"]);
      fm.isSubmitted = true; //  실제 예측 결과 받았으니 비활성화
    }
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(mContext).showSnackBar(SnackBar(content: Text(msg)));
  }
}
