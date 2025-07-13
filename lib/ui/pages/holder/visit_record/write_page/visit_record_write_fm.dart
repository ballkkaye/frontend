import 'package:flutter_riverpod/flutter_riverpod.dart';

final visitRecordWriteProvider =
    NotifierProvider<VisitRecordWriteFM, VisitRecordWriteModel>(() {
  return VisitRecordWriteFM();
});

class VisitRecordWriteFM extends Notifier<VisitRecordWriteModel> {
  @override
  VisitRecordWriteModel build() {
    return VisitRecordWriteModel(0, 0, "", "", "");
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
}

class VisitRecordWriteModel {
  final int gameId;
  final int teamId;
  final String result;
  final String content;
  final String imgUrl;

  VisitRecordWriteModel(
    this.gameId,
    this.teamId,
    this.result,
    this.content,
    this.imgUrl,
  );

  Map<String, dynamic> toMap() {
    return {
      'gameId': gameId,
      'teamId': teamId,
      'result': result,
      'content': content,
      'imgUrl': imgUrl,
    };
  }

  VisitRecordWriteModel copyWith({
    int? gameId,
    int? teamId,
    String? result,
    String? content,
    String? imgUrl,
  }) {
    return VisitRecordWriteModel(
      gameId ?? this.gameId,
      teamId ?? this.teamId,
      result ?? this.result,
      content ?? this.content,
      imgUrl ?? this.imgUrl,
    );
  }

  @override
  String toString() {
    return 'VisitRecordWriteModel{gameId: $gameId,teamId: $teamId,result: $result, content: $content, imgUrl: $imgUrl,}';
  }
}
