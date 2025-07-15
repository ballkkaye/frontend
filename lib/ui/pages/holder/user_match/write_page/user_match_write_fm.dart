import 'package:flutter_riverpod/flutter_riverpod.dart';

final userMatchWriteProvider = NotifierProvider<UserMatchWriteFM, UserMatchWriteModel>(() {
  return UserMatchWriteFM();
});

class UserMatchWriteFM extends Notifier<UserMatchWriteModel> {
  @override
  UserMatchWriteModel build() {
    return UserMatchWriteModel(0, 0, 0, "", "", "", "", false);
  }

  void gameId(int gameId) {
    state = state.copyWith(
      gameId: gameId,
    );
  }

  void teamId(int teamId) {
    state = state.copyWith(
      teamId: teamId,
    );
  }

  void maxParticipants(int maxParticipants) {
    state = state.copyWith(
      maxParticipants: maxParticipants,
    );
  }

  void preferredGender(String preferredGender) {
    state = state.copyWith(
      preferredGender: preferredGender,
    );
  }

  void preferredAge(String preferredAge) {
    state = state.copyWith(
      preferredAge: preferredAge,
    );
  }

  void title(String title) {
    state = state.copyWith(
      title: title,
    );
  }

  void content(String content) {
    state = state.copyWith(
      content: content,
    );
  }

  void isSameTeam(bool isSameTeam) {
    state = state.copyWith(
      isSameTeam: isSameTeam,
    );
  }
}

class UserMatchWriteModel {
  final int gameId;
  final int teamId;
  final int maxParticipants;
  final String preferredGender;
  final String preferredAge;
  final String title;
  final String content;
  final bool isSameTeam;

  UserMatchWriteModel(
    this.gameId,
    this.teamId,
    this.maxParticipants,
    this.preferredGender,
    this.preferredAge,
    this.title,
    this.content,
    this.isSameTeam,
  );

  Map<String, dynamic> toMap() {
    return {
      'gameId': gameId,
      'teamId': teamId,
      'maxParticipants': maxParticipants,
      'preferredGender': preferredGender,
      'preferredAge': preferredAge,
      'title': title,
      'content': content,
      'isSameTeam': isSameTeam,
    };
  }

  UserMatchWriteModel copyWith({
    int? gameId,
    int? teamId,
    int? maxParticipants,
    String? preferredGender,
    String? preferredAge,
    String? title,
    String? content,
    bool? isSameTeam,
  }) {
    return UserMatchWriteModel(
      gameId ?? this.gameId,
      teamId ?? this.teamId,
      teamId ?? this.maxParticipants,
      preferredGender ?? this.preferredGender,
      preferredAge ?? this.preferredAge,
      title ?? this.title,
      content ?? this.content,
      isSameTeam ?? this.isSameTeam,
    );
  }

  @override
  String toString() {
    return 'UserMatchWriteModel{gameId: $gameId, teamId: $teamId, maxParticipants: $maxParticipants, preferredGender: $preferredGender, preferredAge: $preferredAge, title: $title, content: $content, isSameTeam: $isSameTeam}';
  }
}
