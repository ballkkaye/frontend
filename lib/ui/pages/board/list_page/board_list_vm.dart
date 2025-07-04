import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:ballkkaye_frontend/data/model/team.dart';
import 'package:ballkkaye_frontend/data/repository/board_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 1. 창고 관리자
final boardListProvider = StateNotifierProvider<BoardListVM, BoardListModel?>((ref) {
  return BoardListVM();
});

/// 2. 창고 (상태가 변경되어도, 화면 갱신 안함 - watch 하지마)
class BoardListVM extends StateNotifier<BoardListModel?> {
  BoardListVM() : super(null);

  Future<void> init({required String accessToken}) async {
    try {
      final result = await BoardRepository().getBoardList(accessToken);
      state = BoardListModel(
        teams: result['teams'],
        items: result['items'],
      );
    } catch (e) {
      print("BoardListVM Error: $e");
    }
  }
}

/// 3. 창고 데이터 타입 (불변 아님)
class BoardListModel {
  final List<Team> teams;
  final List<BoardItem> items;

  BoardListModel({required this.teams, required this.items});

  BoardListModel copyWith({
    List<Team>? teams,
    List<BoardItem>? items,
  }) {
    return BoardListModel(
      teams: teams ?? this.teams,
      items: items ?? this.items,
    );
  }

  @override
  String toString() {
    return 'BoardListModel(teams: $teams, items: $items)';
  }
}
