import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:ballkkaye_frontend/data/repository/board_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/board_list_board_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final boardDetailBoardProvider = AutoDisposeNotifierProvider.family<
    BoardDetailBoardVM, BoardDetailBoardModel?, int>(() {
  return BoardDetailBoardVM();
});

class BoardDetailBoardVM
    extends AutoDisposeFamilyNotifier<BoardDetailBoardModel?, int> {
  final mContext = navigatorKey.currentContext!;

  @override
  BoardDetailBoardModel? build(int boardId) {
    init(boardId);

    ref.onDispose(() {
      Logger().d("BoardDetailBoardModel 파괴됨");
    });

    return null;
  }

  Future<void> init(int boardId) async {
    Map<String, dynamic> data = await BoardRepository().getOne(boardId);
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("게시글 상세보기 실패 : ${data["msg"]}")),
      );
      return;
    }

    state = BoardDetailBoardModel.fromMap(data["body"]);
  }

  Future<void> updateOne(Board board) async {
    // 1. 통신
    Map<String, dynamic> data = await BoardRepository().updateOne(board);
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("게시글 수정하기 실패 : ${data["msg"]}")),
      );
      return;
    }

    // 2. 파싱
    Board updatedBoard = Board.fromMap(data["body"]);

    // 3. 상태갱신 (detail)
    state = state!.copyWith(board: updatedBoard);

    // 4. 상태갱신 (list -> notify)
    ref.read(boardListBoardProvider.notifier).notifyUpdate(updatedBoard);

    // 5. pop
    Navigator.pop(mContext);
  }
}

class BoardDetailBoardModel {
  Board board;

  BoardDetailBoardModel(this.board);

  BoardDetailBoardModel.fromMap(Map<String, dynamic> data)
      : board = Board.fromMap(data);

  BoardDetailBoardModel copyWith({
    Board? board,
  }) {
    return BoardDetailBoardModel(board ?? this.board);
  }

  @override
  String toString() {
    return 'BoardDetailModel(Board: $board)';
  }
}
