import 'package:ballkkaye_frontend/_core/utils/m_http.dart';
import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:dio/dio.dart';

class BoardRepository {
  Future<Board> getOneBoard({
  }) async {
    try {
      final response = await dio.get(
        ),
      );

      if (response.statusCode == 200) {
        final body = response.data['body'];
        return Board.fromMap(body);
      } else {
        throw Exception("커뮤니티 상세보기 불러오기 실패: ${response.statusCode}");
      }
    } catch (e) {
      print("BoardRepository Error(getBoardDetail):  $e");
      rethrow;
    }
  }
}
