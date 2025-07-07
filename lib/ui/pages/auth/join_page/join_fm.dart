import 'package:flutter_riverpod/flutter_riverpod.dart';

final joinProvider = NotifierProvider<JoinFM, JoinModel>(() {
  return JoinFM();
});

class JoinFM extends Notifier<JoinModel> {
  @override
  JoinModel build() {
    return JoinModel("", 0);
  }

  void nickname(String nickname) {
    state = state.copyWith(
      nickname: nickname,
    );
  }

  void teamId(int teamId) {
    state = state.copyWith(
      teamId: teamId,
    );
  }
}

class JoinModel {
  String? nickname;
  int? teamId;

  JoinModel(
    this.nickname,
    this.teamId,
  );

  Map<String, dynamic> toMap() {
    return {
      "nickname": nickname,
      "teamId": teamId,
    };
  }

  JoinModel copyWith({
    String? nickname,
    int? teamId,
  }) {
    return JoinModel(
      nickname ?? this.nickname,
      teamId ?? this.teamId,
    );
  }

  @override
  String toString() {
    return 'JoinModel{nickname: $nickname, teamId: $teamId}';
  }
}
