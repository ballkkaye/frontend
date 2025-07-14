import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_vm.dart';
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
      state = [
        ...state.sublist(0, index),
        state[index].copyWith(userChoiceTeamId: userChoiceTeamId),
        ...state.sublist(index + 1),
      ];
    } else {
      Logger().i("➕ [FM] 새 예측 추가됨");
      state = [
        ...state,
        UserPredictionFModel(gameId: gameId, userChoiceTeamId: userChoiceTeamId),
      ];
    }
    Logger().i("📌 [FM] 예측 선택됨: $state");
  }

  List<Map<String, dynamic>> toMapList() {
    return state.map((f) => f.toMap()).toList();
  }

  /// VM에 넘길 수 있는 UserPredictionGame 리스트로 변환
  List<UserPredictionGame> toGameList(List<Game> allGames) {
    return state.map((fm) {
      final game = allGames.firstWhere((g) => g.id == fm.gameId);

      return UserPredictionGame(
          game: game, userChoiceTeamId: fm.userChoiceTeamId, awayVoteRate: 50, homeVoteRate: 50, predictionStatus: '');
    }).toList();
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
