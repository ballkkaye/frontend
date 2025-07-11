import 'package:flutter_riverpod/flutter_riverpod.dart';

final visitRecordWriteProvider = NotifierProvider<VisitRecordWriteFM, VisitRecordWriteModel>(() {
  return VisitRecordWriteFM();
});

class VisitRecordWriteFM extends Notifier<VisitRecordWriteModel> {
  @override
  VisitRecordWriteModel build() {
    return VisitRecordWriteModel(0, 0, "", "", 0, 0, "", "", "", "", "", "");
  }

  void id(int id) {
    state = state.copyWith(
      id: id,
    );
  }

  void gameId(int gameId) {
    state = state.copyWith(
      gameId: gameId,
    );
  }

  void homeTeamName(String homeTeamName) {
    state = state.copyWith(
      homeTeamName: homeTeamName,
    );
  }

  void awayTeamName(String awayTeamName) {
    state = state.copyWith(
      awayTeamName: awayTeamName,
    );
  }

  void homeScore(int homeScore) {
    state = state.copyWith(
      homeScore: homeScore,
    );
  }

  void awayScore(int awayScore) {
    state = state.copyWith(
      awayScore: awayScore,
    );
  }

  void gameDate(String gameDate) {
    state = state.copyWith(
      gameDate: gameDate,
    );
  }

  void stadiumName(String stadiumName) {
    state = state.copyWith(
      stadiumName: stadiumName,
    );
  }

  void result(String result) {
    state = state.copyWith(
      result: result,
    );
  }

  void content(String content) {
    state = state.copyWith(
      content: content,
    );
  }

  void imgUrl(String imgUrl) {
    state = state.copyWith(
      imgUrl: imgUrl,
    );
  }

  void deleteStatus(String deleteStatus) {
    state = state.copyWith(
      deleteStatus: deleteStatus,
    );
  }
}

class VisitRecordWriteModel {
  final int id;
  final int gameId;
  final String homeTeamName;
  final String awayTeamName;
  final int homeScore;
  final int awayScore;
  final String gameDate;
  final String stadiumName;
  final String result;
  final String content;
  final String imgUrl;
  final String deleteStatus;

  VisitRecordWriteModel(
    this.id,
    this.gameId,
    this.homeTeamName,
    this.awayTeamName,
    this.homeScore,
    this.awayScore,
    this.gameDate,
    this.stadiumName,
    this.result,
    this.content,
    this.imgUrl,
    this.deleteStatus,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'gameId': gameId,
      'homeTeamName': homeTeamName,
      'awayTeamName': awayTeamName,
      'homeScore': homeScore,
      'awayScore': awayScore,
      'gameDate': gameDate,
      'stadiumName': stadiumName,
      'result': result,
      'content': content,
      'imgUrl': imgUrl,
      'deleteStatus': deleteStatus,
    };
  }

  VisitRecordWriteModel copyWith({
    int? id,
    int? gameId,
    String? homeTeamName,
    String? awayTeamName,
    int? homeScore,
    int? awayScore,
    String? gameDate,
    String? stadiumName,
    String? result,
    String? content,
    String? imgUrl,
    String? deleteStatus,
  }) {
    return VisitRecordWriteModel(
      id ?? this.id,
      gameId ?? this.gameId,
      homeTeamName ?? this.homeTeamName,
      awayTeamName ?? this.awayTeamName,
      homeScore ?? this.homeScore,
      awayScore ?? this.awayScore,
      gameDate ?? this.gameDate,
      stadiumName ?? this.stadiumName,
      result ?? this.result,
      content ?? this.content,
      imgUrl ?? this.imgUrl,
      deleteStatus ?? this.deleteStatus,
    );
  }

  @override
  String toString() {
    return 'VisitRecordWriteModel{id: $id, gameId: $gameId, homeTeamName: $homeTeamName, awayTeamName: $awayTeamName, homeScore: $homeScore, awayScore: $awayScore, gameDate: $gameDate, stadiumName: $stadiumName, result: $result, content: $content, imgUrl: $imgUrl, deleteStatus: $deleteStatus,}';
  }
}
