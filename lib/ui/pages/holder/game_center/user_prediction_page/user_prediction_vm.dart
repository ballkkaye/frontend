import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/data/repository/game_center_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 1. 창고 관리자
final userPredictionProvider = AutoDisposeNotifierProvider<UserPredictionVM, UserPredictionModel?>(() {
  return UserPredictionVM();
});

/// 2. 창고 (상태가 변경되어도, 화면 갱신 안함 - watch 하지마)
class UserPredictionVM extends AutoDisposeNotifier<UserPredictionModel?> {
  final mContext = navigatorKey.currentContext!;
  final refreshCtrl = RefreshController();

  @override
  UserPredictionModel? build() {
    init();

    ref.onDispose(() {
      refreshCtrl.dispose();
      Logger().d("UserPredictionVM 파괴됨");
    });

    return null;
  }

  Future<void> init() async {
    Map<String, dynamic> data = await GameCenterRepository().getUserPrediction();
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("유저 승부예측 조회 실패 : ${data["msg"]}")),
      );
      return;
    }
    state = UserPredictionModel.fromList(data["body"]);
  }

  Future<void> getList() async {
    UserPredictionModel prevModel = state!;
    Map<String, dynamic> data = await GameCenterRepository().getUserPrediction();
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("유저 승부예측 로드 실패 : ${data["msg"]}")),
      );
      return;
    }

    state = UserPredictionModel.fromList(data["body"]);
  }
}

/// 3. 창고 데이터 타입 (불변 아님)
class UserPredictionModel {
  List<Game> games;

  UserPredictionModel(this.games);

  factory UserPredictionModel.fromList(List<dynamic> list) {
    return UserPredictionModel(
      list.map((e) => Game.fromMap(e as Map<String, dynamic>)).toList(),
    );
  }

  UserPredictionModel copyWith({
    List<Game>? games,
  }) {
    return UserPredictionModel(
      games ?? this.games,
    );
  }

  @override
  String toString() {
    return 'TodayGameModel{games: $games}';
  }
}
