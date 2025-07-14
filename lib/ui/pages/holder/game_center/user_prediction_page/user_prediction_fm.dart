import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

/// 1. 창고 관리자
final userPredictionFProvider = NotifierProvider<UserPredictionFM, List<UserPredictionFModel>>(
  () => UserPredictionFM(),
);

/// 2. 창고 (상태가 변경되어도, 화면 갱신 안함 - watch 하지마)
class UserPredictionFM extends Notifier<List<UserPredictionFModel>> {
  @override
  List<UserPredictionFModel> build() => [];

  void selectTeam(int gameId, int userChoiceTeamId) {
    print("✅ FM: selectTeam 호출됨 - gameId: $gameId, teamId: $userChoiceTeamId");
    final index = state.indexWhere((e) => e.gameId == gameId);

    if (index != -1) {
      Logger().d("🔁 [FM] 기존 예측 수정됨 | index: $index");
      state[index] = state[index].copyWith(userChoiceTeamId: userChoiceTeamId);
    } else {
      Logger().i("➕ [FM] 새 예측 추가됨");
      state = [
        ...state,
        UserPredictionFModel(gameId: gameId, userChoiceTeamId: userChoiceTeamId),
      ];
    }
    // ✅ 리스트 전체 출력
    for (var m in state) {
      Logger().i("📦 [FM State] gameId: ${m.gameId}, teamId: ${m.userChoiceTeamId}");
    }
  }
}

class UserPredictionFModel {
  final int gameId;
  final int userChoiceTeamId;

  UserPredictionFModel({
    required this.gameId,
    required this.userChoiceTeamId,
  });

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
