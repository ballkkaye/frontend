import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/data/repository/game_center_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 1. 창고 관리자
final userPredictionProvider = AutoDisposeNotifierProvider<UserPredictionFM, UserPredictionModel?>(() {
  return UserPredictionFM();
});

/// 2. 창고 (상태가 변경되어도, 화면 갱신 안함 - watch 하지마)
class UserPredictionFM extends AutoDisposeNotifier<UserPredictionModel?> {
  BuildContext get mContext => navigatorKey.currentContext!;

  /// context 고정 저장 위험 방지용, 매번 최신값 가져오기
  final refreshCtrl = RefreshController();
  bool isSubmitted = false; // 예측 완료 여부

  @override
  UserPredictionModel? build() {
    ref.onDispose(() {
      refreshCtrl.dispose();
      Logger().d("UserPredictionFM 파괴됨");
    });
    return null;
  }

  /// 2. 유저가 팀 선택 fm
  void selectTeam(int gameId, int teamId) {
    final prev = state!;
    final updatedGames = prev.games.map((g) {
      return g.game.id == gameId ? g.copyWith(userChoiceTeamId: teamId) : g;
    }).toList();

    state = UserPredictionModel(
      games: updatedGames,
      isSubmitted: prev.isSubmitted,
    );
  }

  /// 3. 선택된 값만 JSON으로 추출 → 서버 전송용
  List<Map<String, dynamic>> toJsonList() {
    return state?.games
            .where((g) => g.userChoiceTeamId != null)
            .map((g) => {
                  "gameId": g.game.id,
                  "userChoiceTeamId": g.userChoiceTeamId,
                })
            .toList() ??
        [];
  }

  /// 4. 예측 저장 후 최신 데이터 다시 받아서 상태 갱신
  Future<void> submitPredictions() async {
    final jsonList = toJsonList();

    Logger().i("서버 전송 직전 JSON: $jsonList");

    if (jsonList.isEmpty) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(content: Text("예측할 팀을 선택해주세요.")),
      );
      return;
    }

    // 1단계: 서버에 JSON 전송
    final response = await GameCenterRepository().sendPrediction(jsonList);

    Logger().i("예측 저장 응답: $response");

    if (response["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("예측 저장 실패 : ${response["msg"]}")),
      );
      return;
    }

    // 2단계: 예측 상태를 다시 받아옴
    final result = await GameCenterRepository().getMyPrediction();

    Logger().i("예측 결과 재조회 응답: $result");

    if (result["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("예측 결과 갱신 실패 : ${result["msg"]}")),
      );
      return;
    }
    setPredictionData(result["body"]);
    isSubmitted = true;

    Logger().i("상태 반영 완료!");

    ScaffoldMessenger.of(mContext!).showSnackBar(
      const SnackBar(content: Text("예측이 완료되었습니다.")),
    );
  }

  /// 5. 서버에서 받은 예측 결과로 전체 상태 새로고침
  void setPredictionData(List<dynamic> data) {
    Logger().i("setPredictionData 호출됨. data 길이: ${data.length}");
    final parsed = data.map((e) => UserPredictionGame.fromMap(e)).toList();

    Logger().i("파싱된 모델 예시: ${parsed.first.userChoiceTeamId}, ${parsed.first.predictionStatus}");
    state = UserPredictionModel(
      games: parsed,
      isSubmitted: false,
    );

    for (var g in parsed) {
      print("💡 parsed gameId: ${g.game.id}, selectedTeamId: ${g.userChoiceTeamId}");
    }
  }

  /// 7. 선택 초기화 (선택 해제용) 다음날 새로 팀 새로 선택해야하는경우에 사용
// void clearSelections() {
//   final clearedGames = state!.games.map((g) {
//     return UserPredictionGame(
//       game: g.game,
//       userChoiceTeamId: null,
//       predictionStatus: g.predictionStatus,
//       homeVoteRate: g.homeVoteRate,
//       awayVoteRate: g.awayVoteRate,
//     );
//   }).toList();
//
//   state = UserPredictionModel(clearedGames);
// }
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

  factory UserPredictionGame.fromMap(Map<String, dynamic> map) {
    return UserPredictionGame(
      game: Game.fromMap({
        'gameId': map['gameId'],
        'gameTime': map['gameTime'],
        'homeTeam': map['homeTeam'],
        'awayTeam': map['awayTeam'],
        'homeScore': map['homeScore'],
        'awayScore': map['awayScore'],
        'gameStatus': map['gameStatus'],
      }),
      userChoiceTeamId: map['userChoiceTeamId'],
      predictionStatus: map['predictionStatus'],
      homeVoteRate: (map['homeVoteRate'] as num).toDouble(),
      awayVoteRate: (map['awayVoteRate'] as num).toDouble(),
    );
  }

  UserPredictionGame copyWith({
    Game? game,
    int? userChoiceTeamId,
    String? predictionStatus,
    double? homeVoteRate,
    double? awayVoteRate,
  }) {
    return UserPredictionGame(
      game: game ?? this.game,
      userChoiceTeamId: userChoiceTeamId ?? this.userChoiceTeamId,
      predictionStatus: predictionStatus ?? this.predictionStatus,
      homeVoteRate: homeVoteRate ?? this.homeVoteRate,
      awayVoteRate: awayVoteRate ?? this.awayVoteRate,
    );
  }
}

/// 3. 창고 데이터 타입 (불변 아님)
class UserPredictionModel {
  final List<UserPredictionGame> games;
  final bool isSubmitted;

  UserPredictionModel({
    required this.games,
    required this.isSubmitted,
  });

  factory UserPredictionModel.fromList(List<dynamic> list) {
    return UserPredictionModel(
      games: list.map((e) => UserPredictionGame.fromMap(e)).toList(),
      isSubmitted: false, // 최초 상태 초기값
    );
  }

  UserPredictionModel copyWith({
    List<UserPredictionGame>? games,
    bool? isSubmitted,
  }) {
    return UserPredictionModel(
      games: games ?? this.games,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }

  @override
  String toString() {
    return 'UserPredictionModel(games: $games, isSubmitted: $isSubmitted)';
  }
}
