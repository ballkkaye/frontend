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

/// 2. 창고 (상태가 변경되어도, 화면 갱신 안함 - watch 하지마)
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

    if (beforeData["status"] == 200) {
      // getUserPrediction 성공 시
      state = UserPredictionModel.fromList(beforeData["body"]);
    } else {
      // getUserPrediction 실패 시, getMyPrediction 시도
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("유저 승리 예측 진입 실패: ${beforeData["msg"]}. 나의 승리 예측 조회 시도.")),
      );
      Map<String, dynamic> afterData = await GameCenterRepository().getAfterUserPrediction();
      if (afterData["status"] == 200) {
        state = UserPredictionModel.fromList(afterData["body"]);
        isSubmitted = true; // getMyPrediction 성공 시, 이미 예측이 제출되었다고 가정
      } else {
        ScaffoldMessenger.of(mContext).showSnackBar(
          SnackBar(content: Text("내 예측 정보 조회 실패: ${afterData["msg"]}")),
        );
      }
    }
  }

  /// 2. 서버에 예측 저장 후, 최신 예측 상태를 재요청하여 상태 갱신
  Future<void> submitPredictions(List<UserPredictionFModel> predictionsToSubmit) async {
    // UserPredictionFModel 리스트를 서버 요청 형식인 List<Map<String, dynamic>>으로 변환
    // userChoiceTeamId가 0인 경우(선택 안 함)는 서버에 보내지 않도록 필터링
    final predictions =
        predictionsToSubmit.where((f) => f.userChoiceTeamId != 0).map((f) => f.toMap()).toList();

    Logger().d("서버 전송 직전 JSON: $predictions");

    if (predictions.isEmpty) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        const SnackBar(content: Text("예측할 팀을 선택해주세요.")),
      );
      return;
    }

    /// 2-1. 서버에 JSON 전송
    Map<String, dynamic> data = await GameCenterRepository().sendPrediction(predictions);

    Logger().d("예측 저장 응답: $data");

    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("예측 저장 실패 : ${data["msg"]}")),
      );
      return;
    }

    /// 2-2. 예측 상태를 다시 받아옴 (경기 전/후 상관없이 현재 상태를 가져옴)
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

    isSubmitted = true; // 예측이 제출되었음을 표시

    Logger().d("상태 반영 완료!");

    ScaffoldMessenger.of(mContext).showSnackBar(
      const SnackBar(content: Text("예측이 완료되었습니다.")),
    );
  }
}

/// UserPredictionGame 모델: 서버에서 받아오는 각 게임의 예측 정보
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

  // factory UserPredictionGame.fromMap(Map<String, dynamic> map) {
  //   return UserPredictionGame(
  //     game: Game.fromMap(map),
  //     // userChoiceTeamId가 없거나 null이면 0으로 기본값 설정
  //     userChoiceTeamId: map['userChoiceTeamId'] as int? ?? 0,
  //     // predictionStatus가 없거나 null이면 빈 문자열로 기본값 설정
  //     predictionStatus: map['predictionStatus'] as String? ?? '',
  //     homeVoteRate: (map['homeVoteRate'] as num).toDouble(),
  //     awayVoteRate: (map['awayVoteRate'] as num).toDouble(),
  //   );
  // }

  UserPredictionGame.fromMap(Map<String, dynamic> map)
      : game = Game.fromMap(map),
        userChoiceTeamId = map['userChoiceTeamId'] as int? ?? 0,
        predictionStatus = map['predictionStatus'] as String? ?? '',
        homeVoteRate = (map['homeVoteRate'] as num).toDouble(),
        awayVoteRate = (map['awayVoteRate'] as num).toDouble();
}

/// UserPredictionModel 모델: 전체 예측 게임 목록을 포함하는 VM의 상태
class UserPredictionModel {
  List<UserPredictionGame> games;

  UserPredictionModel(this.games);

  // factory UserPredictionModel.fromList(List<dynamic> list) {
  //   return UserPredictionModel(
  //     list.map((e) => UserPredictionGame.fromMap(e as Map<String, dynamic>)).toList(),
  //   );
  // }
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
