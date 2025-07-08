import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:ballkkaye_frontend/data/repository/board_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 1. 창고 관리자
final boardListProvider = AutoDisposeNotifierProvider<BoardListVM, BoardListModel?>(() {
  return BoardListVM();
});

/// 2. 창고 (상태가 변경되어도, 화면 갱신 안함 - watch 하지마)
class BoardListVM extends AutoDisposeNotifier<BoardListModel?> {
  final mContext = navigatorKey.currentContext!;
  final refreshCtrl = RefreshController();

  @override
  BoardListModel? build() {
    init();

    ref.onDispose(() {
      refreshCtrl.dispose();
      Logger().d("PostListVM 파괴됨");
    });

    return null;
  }

  Future<void> init() async {
    Map<String, dynamic> data = await BoardRepository().getList();
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("게시글 목록보기 실패 : ${data["msg"]}")),
      );
      return;
    }
    state = BoardListModel.fromMap(data["body"]);
  }

  void notifyUpdate(Board board) {
    List<Board> nextBoards = state!.boards.map((p) {
      if (p.boardId == board.boardId) {
        return board;
      } else {
        return p;
      }
    }).toList();

    state = state!.copyWith(boards: nextBoards);
  }

  Future<void> getList() async {
    BoardListModel prevModel = state!;
    Map<String, dynamic> data = await BoardRepository().getList();
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("게시글 로드 실패 : ${data["msg"]}")),
      );
      return;
    }

    BoardListModel nextModel = BoardListModel.fromMap(data["body"]);

    state = nextModel.copyWith(boards: [...prevModel.boards, ...nextModel.boards]);
  }
}

/// 3. 창고 데이터 타입 (불변 아님)
class BoardListModel {
  List<Board> boards;

  BoardListModel(this.boards);

  BoardListModel.fromMap(Map<String, dynamic> data)
      : boards = (data['items'] as List).map((e) => Board.fromMap(e)).toList();

  BoardListModel copyWith({
    List<Board>? boards,
  }) {
    return BoardListModel(
      boards ?? this.boards,
    );
  }

  @override
  String toString() {
    return 'BoardListModel{boards: $boards}';
  }
}
