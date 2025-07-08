import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 1. 창고 관리자
final boardWriteProvider = NotifierProvider<BoardWriteFM, BoardWriteModel>(() {
  return BoardWriteFM();
});

/// 2. 창고
class BoardWriteFM extends Notifier<BoardWriteModel> {
  @override
  BoardWriteModel build() {
    return BoardWriteModel("", "", 0);
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
}

/// 3. 창고 데이터 타입
class BoardWriteModel {
  final String title;
  final String content;
  final int teamId;

  BoardWriteModel(
      this.title,
      this.content,
      this.teamId,
      );

  BoardWriteModel copyWith({
    String? title,
    String? content,
    int? teamId,
  }) {
    return BoardWriteModel(
      title ?? this.title,
      content ?? this.content,
      teamId ?? this.teamId,
    );
  }

  @override
  String toString() {
    return 'PostWriteModel{title: $title, content: $content, teamId: $teamId}';
  }
}