import 'package:flutter_riverpod/flutter_riverpod.dart';

final userUpdateProvider = NotifierProvider<UserUpdateFM, UserUpdateModel>(() {
  return UserUpdateFM();
});

class UserUpdateFM extends Notifier<UserUpdateModel> {
  @override
  UserUpdateModel build() {
    return UserUpdateModel("", 0, "");
  }

  void nickname(String nickname) {
    state = state.copyWith(
      nickname: nickname,
    );
  }

  void teamId(int teamId) {
    state = state.copyWith(teamId: teamId);
  }

  void profileUrl(String profileUrl) {
    state = state.copyWith(profileUrl: profileUrl);
  }
}

class UserUpdateModel {
  String? nickname;
  int? teamId;
  String? profileUrl;

  UserUpdateModel(
    this.nickname,
    this.teamId,
    this.profileUrl,
  );

  Map<String, dynamic> toMap() {
    return {
      "nickname": nickname,
      "teamId": teamId,
      "profileUrl": profileUrl,
    };
  }

  UserUpdateModel copyWith({
    String? nickname,
    int? teamId,
    String? profileUrl,
  }) {
    return UserUpdateModel(
      nickname ?? this.nickname,
      teamId ?? this.teamId,
      profileUrl ?? this.profileUrl,
    );
  }

  @override
  String toString() {
    return 'UserUpdateModel{nickname: $nickname, teamId: $teamId, profileUrl: $profileUrl}';
  }
}
