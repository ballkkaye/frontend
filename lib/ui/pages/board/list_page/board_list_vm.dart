import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:ballkkaye_frontend/data/repository/board_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// /// 1. 창고 관리자
// final boardListProvider = StateNotifierProvider<BoardListVM, BoardListModel?>((ref) {
//   return BoardListVM();
// });
//
// /// 2. 창고 (상태가 변경되어도, 화면 갱신 안함 - watch 하지마)
// class BoardListVM extends StateNotifier<BoardListModel?> {
//   BoardListVM() : super(null);
//
//   Future<void> init({required String accessToken}) async {
//     try {
//       final result = await BoardRepository().getList();
//       state = BoardListModel(
//         teams: result['teams'],
//         items: result['items'],
//       );
//     } catch (e) {
//       print("BoardListVM Error: $e");
//     }
//   }
// }
//
// /// 3. 창고 데이터 타입 (불변 아님)
// class BoardListModel {
//   final List<Team> teams;
//   final List<BoardItem> items;
//
//   BoardListModel({required this.teams, required this.items});
//
//   BoardListModel copyWith({
//     List<Team>? teams,
//     List<BoardItem>? items,
//   }) {
//     return BoardListModel(
//       teams: teams ?? this.teams,
//       items: items ?? this.items,
//     );
//   }
//
//   @override
//   String toString() {
//     return 'BoardListModel(teams: $teams, items: $items)';
//   }
// }

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

  Future<void> nextList() async {
    BoardListModel prevModel = state!;
    Map<String, dynamic> body = await BoardRepository().getList();
    if (!body["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("게시글 로드 실패 : ${body["errorMessage"]}")),
      );
      refreshCtrl.loadComplete();
      return;
    }

    BoardListModel nextModel = BoardListModel.fromMap(body["response"]);

    state = nextModel.copyWith(boards: [...prevModel.boards, ...nextModel.boards]);
    refreshCtrl.loadComplete();
  }
}

/// 3. 창고 데이터 타입 (불변 아님)
class BoardListModel {
  List<Board> boards;

  BoardListModel(this.boards);

  BoardListModel.fromMap(Map<String, dynamic> data)
      : boards = (data['boards'] as List).map((e) => Board.fromMap(e)).toList();

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
