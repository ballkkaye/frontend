import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/data/repository/game_center_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 1. 창고 관리자
final todayGameProvider = AutoDisposeNotifierProvider<TodayGameVM, TodayGameModel?>(() {
  return TodayGameVM();
});

/// 2. 창고 (상태가 변경되어도, 화면 갱신 안함 - watch 하지마)
class TodayGameVM extends AutoDisposeNotifier<TodayGameModel?> {
  final mContext = navigatorKey.currentContext!;
  final refreshCtrl = RefreshController();

  @override
  TodayGameModel? build() {
    init();

    ref.onDispose(() {
      refreshCtrl.dispose();
      Logger().d("todayGameVM 파괴됨");
    });

    return null;
  }

  Future<void> init() async {
    Map<String, dynamic> data = await GameCenterRepository().getTodayGame();
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("오늘의 경기 조회 실패 : ${data["msg"]}")),
      );
      return;
    }
    state = TodayGameModel.fromList(data["body"]);
  }

  Future<void> getList() async {
    Map<String, dynamic> data = await GameCenterRepository().getTodayGame();
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("오늘의 경기 로드 실패 : ${data["msg"]}")),
      );
      return;
    }

    state = TodayGameModel.fromList(data["body"]);
  }
}

/// 3. 창고 데이터 타입 (불변 아님)
class TodayGameModel {
  List<Game> games;

  TodayGameModel(this.games);

  factory TodayGameModel.fromList(List<dynamic> list) {
    return TodayGameModel(
      list.map((e) => Game.fromMap(e as Map<String, dynamic>)).toList(),
    );
  }

  TodayGameModel copyWith({
    List<Game>? games,
  }) {
    return TodayGameModel(
      games ?? this.games,
    );
  }

  @override
  String toString() {
    return 'TodayGameModel{games: $games}';
  }
}
