import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:ballkkaye_frontend/data/repository/board_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 1. 창고 관리자
final boardListBoardProvider =
    AutoDisposeNotifierProvider<BoardListBoardVM, BoardListBoardModel?>(() {
  return BoardListBoardVM();
});

/// 2. 창고 (상태가 변경되어도, 화면 갱신 안함 - watch 하지마)
class BoardListBoardVM extends AutoDisposeNotifier<BoardListBoardModel?> {
  final mContext = navigatorKey.currentContext!;
  final refreshCtrl = RefreshController();

  @override
  BoardListBoardModel? build() {
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
    state = BoardListBoardModel.fromMap(data["body"]);
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
    BoardListBoardModel prevModel = state!;
    Map<String, dynamic> data = await BoardRepository().getList();
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("게시글 로드 실패 : ${data["msg"]}")),
      );
      return;
    }

    BoardListBoardModel nextModel = BoardListBoardModel.fromMap(data["body"]);

    state = nextModel.copyWith(boards: [...prevModel.boards, ...nextModel.boards]);
  }

  Future<void> write(int teamId, String title, String content) async {
    // 1. 레포지토리에 함수 호출
    Map<String, dynamic> data = await BoardRepository().write(teamId, title, content);
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("게시글 쓰기 실패 : ${data["msg"]}")),
      );
      return;
    }
    Board board = Board.fromMap(data["body"]);
    List<Board> nextBoards = [board, ...state!.boards];
    state = state!.copyWith(boards: nextBoards);
    Navigator.pop(mContext!);
  }
}

/// 3. 창고 데이터 타입 (불변 아님)
class BoardListBoardModel {
  List<Board> boards;

  BoardListBoardModel(this.boards);

  BoardListBoardModel.fromMap(Map<String, dynamic> data)
      : boards = (data['items'] as List).map((e) => Board.fromMap(e)).toList();
  
  BoardListBoardModel copyWith({
    List<Board>? boards,
  }) {
    return BoardListBoardModel(
      boards ?? this.boards,
    );
  }

  @override
  String toString() {
    return 'BoardListModel{boards: $boards}';
  }
}
