import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final userPredictionFProvider = NotifierProvider<UserPredictionFM, List<UserPredictionFModel>>(
  () => UserPredictionFM(),
);

class UserPredictionFM extends Notifier<List<UserPredictionFModel>> {
  @override
  List<UserPredictionFModel> build() => [];

  void selectTeam(int gameId, int userChoiceTeamId) {
    Logger().d("FM: selectTeam 호출됨 - gameId: $gameId, teamId: $userChoiceTeamId");
    final index = state.indexWhere((e) => e.gameId == gameId);

    if (index != -1) {
      // 기존 예측이 있는 경우
      final existingPrediction = state[index];
      if (existingPrediction.userChoiceTeamId == userChoiceTeamId) {
        // 이미 선택된 팀을 다시 클릭한 경우: 선택 취소 (해당 예측 모델 삭제)
        Logger().d("[FM] 기존 예측 취소됨 | gameId: $gameId");
        state = [
          ...state.sublist(0, index),
          ...state.sublist(index + 1),
        ];
      } else {
        // 다른 팀을 선택한 경우: 기존 예측 수정
        Logger().d("[FM] 기존 예측 수정됨 | index: $index");
        state = [
          ...state.sublist(0, index),
          existingPrediction.copyWith(userChoiceTeamId: userChoiceTeamId),
          ...state.sublist(index + 1),
        ];
      }
    } else {
      // 새로운 예측 추가
      Logger().d("[FM] 새 예측 추가됨");
      state = [
        ...state,
        UserPredictionFModel(gameId: gameId, userChoiceTeamId: userChoiceTeamId),
      ];
    }
    Logger().d(
        "[FM] 예측 현재 상태: ${state.map((e) => 'Game:${e.gameId}, Team:${e.userChoiceTeamId}').join(', ')}");
  }
}

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

  static List<Map<String, dynamic>> toMapList(List<UserPredictionFModel> list) {
    return list.map((f) => f.toMap()).toList();
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
    return 'UserPredictionModel(gameId: $gameId, userChoiceTeamId: $userChoiceTeamId)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPredictionFModel &&
          runtimeType == other.runtimeType &&
          gameId == other.gameId &&
          userChoiceTeamId == other.userChoiceTeamId;

  @override
  int get hashCode => gameId.hashCode ^ userChoiceTeamId.hashCode;
}
