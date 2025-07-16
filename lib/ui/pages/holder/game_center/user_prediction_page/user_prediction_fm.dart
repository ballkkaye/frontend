import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final userPredictionFProvider = NotifierProvider<UserPredictionFM, List<UserPredictionFModel>>(
  () => UserPredictionFM(),
);

class UserPredictionFM extends Notifier<List<UserPredictionFModel>> {
  @override
  List<UserPredictionFModel> build() => [];

  void selectTeam(int gameId, int userChoiceTeamId) {
    Logger().d("✅ FM: selectTeam 호출됨 - gameId: $gameId, teamId: $userChoiceTeamId");
    final index = state.indexWhere((e) => e.gameId == gameId);

    if (index != -1) {
      Logger().d("[FM] 기존 예측 수정됨 | index: $index");
      state = [
        ...state.sublist(0, index),
        state[index].copyWith(userChoiceTeamId: userChoiceTeamId),
        ...state.sublist(index + 1),
      ];
    } else {
      Logger().d("[FM] 새 예측 추가됨");
      state = [
        ...state,
        UserPredictionFModel(gameId: gameId, userChoiceTeamId: userChoiceTeamId),
      ];
    }
    Logger().d("[FM] 예측 선택됨: $state");
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
}
