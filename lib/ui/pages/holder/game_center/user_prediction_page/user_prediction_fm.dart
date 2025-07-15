// user_prediction_fm.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

/// 창고 관리자
final userPredictionFProvider =
    NotifierProvider<UserPredictionFM, List<UserPredictionFModel>>(
  () => UserPredictionFM(),
);

/// 창고 (사용자 선택한 예측 리스트를 관리)
class UserPredictionFM extends Notifier<List<UserPredictionFModel>> {
  @override
  List<UserPredictionFModel> build() => [];

  /// 팀 선택 시 호출되는 메서드
  void selectTeam(int gameId, int userChoiceTeamId) {
    Logger()
        .d("✅ [FM] selectTeam 호출 - gameId: $gameId, teamId: $userChoiceTeamId");
    final index = state.indexWhere((e) => e.gameId == gameId);

    if (index != -1) {
      // 기존 선택 수정
      state = [
        ...state.sublist(0, index),
        state[index].copyWith(userChoiceTeamId: userChoiceTeamId),
        ...state.sublist(index + 1),
      ];
      Logger().d("🔁 [FM] 예측 수정됨 | index: $index");
    } else {
      // 새 선택 추가
      state = [
        ...state,
        UserPredictionFModel(
            gameId: gameId, userChoiceTeamId: userChoiceTeamId),
      ];
      Logger().d("➕ [FM] 예측 추가됨");
    }

    Logger().d("📌 [FM] 현재 예측 리스트: $state");
  }

  /// 서버 전송용 Map 리스트로 변환
  List<Map<String, dynamic>> toMapList() {
    return state.map((f) => f.toMap()).toList();
  }

  // /// 필요 시 VM로 넘기기 위한 변환 메서드 (예측 결과 X)
  // List<UserPredictionGame> toGameList(List<Game> allGames) {
  //   return state.map((fm) {
  //     final game = allGames.firstWhere((g) => g.id == fm.gameId);
  //     return UserPredictionGame(
  //       game: game,
  //       userChoiceTeamId: fm.userChoiceTeamId,
  //       homeVoteRate: 50,
  //       awayVoteRate: 50,
  //       predictionStatus: '',
  //     );
  //   }).toList();
  // }
}

/// 유저 예측 모델 (단일 게임)
class UserPredictionFModel {
  final int gameId;
  final int userChoiceTeamId;

  UserPredictionFModel({
    required this.gameId,
    required this.userChoiceTeamId,
  });

  Map<String, dynamic> toMap() {
    return {
      'gameId': gameId,
      'userChoiceTeamId': userChoiceTeamId,
    };
  }

  UserPredictionFModel copyWith({
    int? gameId,
    int? userChoiceTeamId,
  }) {
    return UserPredictionFModel(
      gameId: gameId ?? this.gameId,
      userChoiceTeamId: userChoiceTeamId ?? this.userChoiceTeamId,
    );
  }

  @override
  String toString() {
    return 'UserPredictionFModel(gameId: $gameId, userChoiceTeamId: $userChoiceTeamId)';
  }
}
