import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:ballkkaye_frontend/data/repository/board_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 1. 창고 관리자
final boardDetailProvider = StateNotifierProvider<BoardDetailVM, Board?>((ref) {
  return BoardDetailVM();
});

/// 2. 창고 (상태가 변경되어도, 화면 갱신 안함 - watch 하지마)
class BoardDetailVM extends StateNotifier<Board?> {
  BoardDetailVM() : super(null);

  Future<void> getBoardDetail({
    required String accessToken,
    required int boardId,
  }) async {
    try {
      final detail = await BoardRepository().getBoardDetail(
        accessToken: accessToken,
        boardId: boardId,
      );
      state = detail;
    } catch (e) {
      print("BoardListVM Error: $e");
    }
  }
}

/// 3. 창고 데이터 타입 (불변 아님)
class BoardDetailModel {
  final Board? detail;

  BoardDetailModel({required this.detail});

  BoardDetailModel copyWith({
    Board? detail,
  }) {
    return BoardDetailModel(
      detail: detail ?? this.detail,
    );
  }

  @override
  String toString() {
    return 'BoardListModel(detail: $detail)';
  }
}
