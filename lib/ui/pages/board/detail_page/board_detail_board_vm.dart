import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:ballkkaye_frontend/data/repository/board_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final boardDetailBoardProvider =
    AutoDisposeNotifierProvider.family<BoardDetailBoardVM, BoardDetailBoardModel?, int>(() {
  return BoardDetailBoardVM();
});

// 창고
class BoardDetailBoardVM extends AutoDisposeFamilyNotifier<BoardDetailBoardModel?, int> {
  final mContext = navigatorKey.currentContext!;

  @override
  BoardDetailBoardModel? build(int boardId) {
    // 1. 상태 초기화
    init(boardId);

    // 2. VM 파괴되는지 확인하는 이벤트
    ref.onDispose(() {
      Logger().d("BoardDetailBoardVM 파괴됨");
    });

    // 3. 상태 값 세팅
    return null;
  }

  Future<void> init(int boardId) async {
    Map<String, dynamic> data = await BoardRepository().getOne(boardId);
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("게시글 상세보기 - 게시글 통신 실패 : ${data["msg"]}")),
      );
      return;
    }

    state = BoardDetailBoardModel.fromMap(data["body"]);
  }
}

class BoardDetailBoardModel {
  Board board;

  // 생성자
  BoardDetailBoardModel(this.board);

  // fromMap
  BoardDetailBoardModel.fromMap(Map<String, dynamic> data) : board = Board.fromMap(data);

  // copyWith
  BoardDetailBoardModel copyWith({
    Board? board,
  }) {
    return BoardDetailBoardModel(board ?? this.board);
  }

  // toString
  @override
  String toString() {
    return 'BoardDetailBoardModel(board: $board)';
  }
}
