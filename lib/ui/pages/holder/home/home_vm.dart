import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:ballkkaye_frontend/data/repository/home_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/board_list_board_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/prediction_page/prediction_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/today_game_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 1. 창고 관리자
final homeProvider = AutoDisposeNotifierProvider<HomeVM, HomeModel?>(() {
  return HomeVM();
});

/// 2. 창고 (상태가 변경되어도, 화면 갱신 안함 - watch 하지마)
class HomeVM extends AutoDisposeNotifier<HomeModel?> {
  final mContext = navigatorKey.currentContext!;
  final refreshCtrl = RefreshController();

  @override
  HomeModel? build() {
    init();

    ref.onDispose(() {
      refreshCtrl.dispose();
      Logger().d("homeVM 파괴됨");
    });

    return null;
  }

  Future<void> init() async {
    Map<String, dynamic> data = await HomeRepository().getHome();
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("홈 조회 실패 : ${data["msg"]}")),
      );
      return;
    }
    state = HomeModel.fromMap(data["body"]);
  }
}

/// 3. 창고 데이터 타입 (불변 아님)
class HomeModel {
  final TodayGameModel todayGameModel;
  final PredictionModel predictionModel;
  final BoardListBoardModel boardListModel;

  HomeModel({
    required this.todayGameModel,
    required this.predictionModel,
    required this.boardListModel,
  });

  factory HomeModel.fromMap(Map<String, dynamic> data) {
    return HomeModel(
      todayGameModel: TodayGameModel.fromList(data['todayGames']),
      predictionModel: PredictionModel.fromList(data['winPredictions']),
      boardListModel: BoardListBoardModel(
        (data['boards'] as List<dynamic>).map((e) => Board.fromSimple(e)).toList(),
      ),
    );
  }

  @override
  String toString() {
    return 'HomeModel{todayGameModel: $todayGameModel, predictionModel: $predictionModel, boardListModel: $boardListModel}';
  }
}
