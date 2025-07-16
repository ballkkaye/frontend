import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/data/repository/game_center_repository.dart';
import 'package:ballkkaye_frontend/main.dart'; // navigatorKey 접근을 위해 필요
// UserPredictionFModel을 import 해야 합니다.
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_fm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 1. 창고 관리자
final userPredictionProvider =
    AutoDisposeNotifierProvider<UserPredictionVM, UserPredictionModel?>(() {
  return UserPredictionVM();
});

/// 2. 창고
class UserPredictionVM extends AutoDisposeNotifier<UserPredictionModel?> {
  final mContext = navigatorKey.currentContext!;
  final refreshCtrl = RefreshController();
  bool isSubmitted = false; // 예측 완료 여부

  @override
  UserPredictionModel? build() {
    init();

    ref.onDispose(() {
      refreshCtrl.dispose();
      Logger().d("UserPredictionVM 파괴됨");
    });

    return null;
  }

  /// 1. 앱 최초 진입 시 서버에서 예측 데이터 불러오기
  /// getUserPrediction 실패 시 getMyPrediction 시도
  Future<void> init() async {
    Map<String, dynamic> beforeData = await GameCenterRepository().getBeforeUserPrediction();

    if ((beforeData["status"] == 200 &&
        beforeData["body"] != null &&
        beforeData["body"].isNotEmpty)) {
      // getUserPrediction 성공 시
      state = UserPredictionModel.fromList(beforeData["body"]);
    } else {
      // getBeforeUserPrediction 실패 시, getAfterUserPrediction 시도
      Logger().d("유저 승리 예측 진입 실패: ${beforeData["msg"]}. 나의 승리 예측 조회 시도.");
      Map<String, dynamic> afterData = await GameCenterRepository().getAfterUserPrediction();
      if (afterData["status"] == 200) {
        state = UserPredictionModel.fromList(afterData["body"]);
        isSubmitted = true;
      } else {
        ScaffoldMessenger.of(mContext).showSnackBar(
          SnackBar(content: Text("내 예측 정보 조회 실패: ${afterData["msg"]}")),
        );
      }
    }

    refreshCtrl.refreshCompleted();
  }

  Future<void> submitPredictions(List<UserPredictionFModel> predictionsToSubmit) async {
    final predictions =
        predictionsToSubmit.where((f) => f.userChoiceTeamId != 0).map((f) => f.toMap()).toList();

    Logger().d("서버 전송 직전 JSON: $predictions");

    if (predictions.isEmpty) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("예측할 팀을 선택해주세요.")),
      );
      return;
    }

    Map<String, dynamic> data = await GameCenterRepository().sendPrediction(predictions);

    Logger().d("예측 저장 응답: $data");

    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("예측 저장 실패 : ${data["msg"]}")),
      );
      return;
    }

    Map<String, dynamic> result = await GameCenterRepository().getAfterUserPrediction();

    Logger().d("예측 결과 재조회 응답: $result");

    if (result["status"] != 200) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("예측 결과 갱신 실패 : ${result["msg"]}")),
      );
      return;
    }

    final updatedGames = UserPredictionModel.fromList(result["body"]).games;

    state = state!.copyWith(games: updatedGames);

    isSubmitted = true;

    Logger().d("상태 반영 완료!");

    ScaffoldMessenger.of(mContext).showSnackBar(
      const SnackBar(content: Text("예측이 완료되었습니다.")),
    );
  }
}

class UserPredictionGame {
  final Game game;
  final int? userChoiceTeamId;
  final String? predictionStatus;
  final double homeVoteRate;
  final double awayVoteRate;

  UserPredictionGame({
    required this.game,
    required this.userChoiceTeamId,
    required this.predictionStatus,
    required this.homeVoteRate,
    required this.awayVoteRate,
  });

  UserPredictionGame.fromMap(Map<String, dynamic> map)
      : game = Game.fromMap(map),
        userChoiceTeamId = map['userChoiceTeamId'] as int? ?? 0,
        predictionStatus = map['predictionStatus'] as String? ?? '',
        homeVoteRate = (map['homeVoteRate'] as num).toDouble(),
        awayVoteRate = (map['awayVoteRate'] as num).toDouble();
}

class UserPredictionModel {
  List<UserPredictionGame> games;

  UserPredictionModel(this.games);

  UserPredictionModel.fromList(List<dynamic> list)
      : games = list.map((e) => UserPredictionGame.fromMap(e as Map<String, dynamic>)).toList();

  UserPredictionModel copyWith({
    List<UserPredictionGame>? games,
  }) {
    return UserPredictionModel(
      games ?? this.games,
    );
  }

  @override
  String toString() {
    return 'UserPredictionModel{games: $games}';
  }
}
