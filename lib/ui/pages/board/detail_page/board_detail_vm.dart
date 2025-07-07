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

  Future<void> getOne({
    required int boardId,
  }) async {
    try {
      final response = await BoardRepository().getOne(boardId);

      if (response.statusCode == 200) {
        final body = response.data['body'];
        state = Board.fromMap(body); // 모델로 변환
      } else {
        throw Exception("게시글 상세조회 실패: ${response.statusCode}");
      }
    } catch (e) {
      print("BoardDetailVM Error(getOne): $e");
      // 스낵바나 토스트 알림 등도 여기서 처리
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
