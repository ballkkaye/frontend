import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/data/repository/game_center_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 1. 창고 관리자
final predictionProvider = AutoDisposeNotifierProvider<PredictionVM, PredictionModel?>(() {
  return PredictionVM();
});

/// 2. 창고 (상태가 변경되어도, 화면 갱신 안함 - watch 하지마)
class PredictionVM extends AutoDisposeNotifier<PredictionModel?> {
  final mContext = navigatorKey.currentContext!;
  final refreshCtrl = RefreshController();

  @override
  PredictionModel? build() {
    init();

    ref.onDispose(() {
      refreshCtrl.dispose();
      Logger().d("PredictionVM 파괴됨");
    });

    return null;
  }

  Future<void> init() async {
    Map<String, dynamic> data = await GameCenterRepository().getPrediction();
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("승부 예측 조회 실패 : ${data["msg"]}")),
      );
      return;
    }
    state = PredictionModel.fromList(data["body"]);
  }
}

class PredictionGame {
  final Game game;
  final String? homeTeamName;
  final String? awayTeamName;
  final String? homePitcherProfileUrl;
  final String? awayPitcherProfileUrl;
  final double? homePredictionScore;
  final double? awayPredictionScore;
  final double? totalPredictionScore;
  final double? homeWinPercent;
  final double? awayWinPercent;

  PredictionGame({
    required this.game,
    this.homeTeamName,
    this.awayTeamName,
    this.homePitcherProfileUrl,
    this.awayPitcherProfileUrl,
    this.homePredictionScore,
    this.awayPredictionScore,
    this.totalPredictionScore,
    this.homeWinPercent,
    this.awayWinPercent,
  });

  factory PredictionGame.fromMap(Map<String, dynamic> map) {
    return PredictionGame(
      game: Game.fromMap(map),
      homeTeamName: map['homeTeamName'],
      awayTeamName: map['awayTeamName'],
      homePitcherProfileUrl: map['homePitcherProfileUrl'],
      awayPitcherProfileUrl: map['awayPitcherProfileUrl'],
      homePredictionScore: (map['homePredictionScore'] as num?)?.toDouble(),
      awayPredictionScore: (map['awayPredictionScore'] as num?)?.toDouble(),
      totalPredictionScore: (map['totalPredictionScore'] as num?)?.toDouble(),
      homeWinPercent: (map['homeWinPercent'] as num?)?.toDouble(),
      awayWinPercent: (map['awayWinPercent'] as num?)?.toDouble(),
    );
  }
}

class PredictionModel {
  List<PredictionGame> games;

  PredictionModel(this.games);

  factory PredictionModel.fromList(List<dynamic> list) {
    return PredictionModel(
      list.map((e) => PredictionGame.fromMap(e)).toList(),
    );
  }


  @override
  String toString() {
    return 'PredictionModel{games: $games}';
  }
}
