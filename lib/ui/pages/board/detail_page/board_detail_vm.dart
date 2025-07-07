import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:ballkkaye_frontend/data/repository/board_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final boardDetailProvider = AutoDisposeNotifierProvider.family<BoardDetailVM, BoardDetailModel?, int>(() {
  return BoardDetailVM();
});

// TODO 3 : init 완성하기 (state 갱신)
class BoardDetailVM extends AutoDisposeFamilyNotifier<BoardDetailModel?, int> {
  final mContext = navigatorKey.currentContext!;

  @override
  BoardDetailModel? build(int boardId) {
    // 1. 상태 초기화
    init(boardId);

    // 2. VM 파괴되는지 확인하는 이벤트
    ref.onDispose(() {
      Logger().d("BoardDetailModel 파괴됨");
    });

    // 3. 상태 값 세팅
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

    state = BoardDetailModel.fromMap(data["body"]);
  }
}

// TODO 2 : replies 빼고 상태로 관리하기
class BoardDetailModel {
  Board board;

  BoardDetailModel(this.board);

  BoardDetailModel.fromMap(Map<String, dynamic> data) : board = Board.fromMap(data);

  BoardDetailModel copyWith({
    Board? board,
  }) {
    return BoardDetailModel(board ?? this.board);
  }

  @override
  String toString() {
    return 'BoardDetailModel(Board: $board)';
  }
}
