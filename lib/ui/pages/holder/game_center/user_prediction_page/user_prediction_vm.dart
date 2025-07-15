import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/data/repository/game_center_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// Provider
final userPredictionProvider =
    AutoDisposeNotifierProvider<UserPredictionVM, UserPredictionState?>(
  () => UserPredictionVM(),
);

// VM
class UserPredictionVM extends AutoDisposeNotifier<UserPredictionState?> {
  final mContext = navigatorKey.currentContext!;
  final refreshCtrl = RefreshController();
  bool isSubmitted = false;

  @override
  UserPredictionState? build() {
    init();

    ref.onDispose(() {
      refreshCtrl.dispose();
      Logger().d("UserPredictionVM 파괴됨");
    });

    return null;
  }

  Future<void> init() async {
    final data = await GameCenterRepository().getBeforePredictionList();

    if (data["status"] != 200) {
      _showSnack("유저 예측 데이터 조회 실패 : ${data["msg"]}");
      return;
    }

    final games = (data["body"] as List)
        .map((e) => UserPredictionGame.fromMap(e))
        .toList();

    final allPredicted = games.every((g) => g.userChoiceTeamId != null);

    state = allPredicted ? AfterPrediction(games) : BeforePrediction(games);
    isSubmitted = allPredicted;

    Logger().d("초기 상태: ${isSubmitted ? 'After' : 'Before'}");
  }

  Future<void> submitPredictions(List<Map<String, dynamic>> predictions) async {
    if (predictions.isEmpty) {
      _showSnack("예측할 팀을 선택해주세요.");
      return;
    }

    final response = await GameCenterRepository().sendPrediction(predictions);
    Logger().d("예측 저장 응답: $response");

    if (response["status"] != 200) {
      _showSnack("예측 저장 실패 : ${response["msg"]}");
      return;
    }

    final result = await GameCenterRepository().getAfterPredictionList();
    Logger().d("예측 결과 재조회 응답: $result");

    if (result["status"] != 200) {
      _showSnack("예측 결과 갱신 실패 : ${result["msg"]}");
      return;
    }

    final games = (result["body"] as List)
        .map((e) => UserPredictionGame.fromMap(e))
        .toList();

    state = AfterPrediction(games);
    isSubmitted = true;

    _showSnack("예측이 완료되었습니다.");
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(mContext).showSnackBar(SnackBar(content: Text(msg)));
  }
}

/// 상태 타입
sealed class UserPredictionState {}

class BeforePrediction extends UserPredictionState {
  final List<UserPredictionGame> games;

  BeforePrediction(this.games);
}

class AfterPrediction extends UserPredictionState {
  final List<UserPredictionGame> games;

  AfterPrediction(this.games);
}

/// 공통 게임 모델
class UserPredictionGame {
  final Game game;
  final int? userChoiceTeamId;
  final String? predictionStatus;
  final double homeVoteRate;
  final double awayVoteRate;

  UserPredictionGame({
    required this.game,
    this.userChoiceTeamId,
    this.predictionStatus,
    required this.homeVoteRate,
    required this.awayVoteRate,
  });

  factory UserPredictionGame.fromMap(Map<String, dynamic> map) {
    return UserPredictionGame(
      game: Game.fromMap(map),
      userChoiceTeamId: map['userChoiceTeamId'],
      predictionStatus: map['predictionStatus'] ?? '',
      homeVoteRate: (map['homeVoteRate'] ?? 0).toDouble(),
      awayVoteRate: (map['awayVoteRate'] ?? 0).toDouble(),
    );
  }
}
