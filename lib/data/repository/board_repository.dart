import 'package:ballkkaye_frontend/_core/utils/m_http.dart';
import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:dio/dio.dart';

class BoardRepository {
  Future<BoardDetailItem> getBoardDetail({
    required String accessToken,
    required int boardId,
  }) async {
    try {
      final response = await dio.get(
        "/s/api/boards/$boardId",
        options: Options(headers: {
          "Authorization": "Bearer $accessToken",
        }),
      );

      print("API statusCode: ${response.statusCode}");
      print("API data: ${response.data}");

      if (response.statusCode == 200) {
        final body = response.data['body'];
        return BoardDetailItem.fromMap(body);
      } else {
        throw Exception("커뮤니티 상세보기 불러오기 실패: ${response.statusCode}");
      }
    } catch (e) {
      print("BoardRepository Error(getBoardDetail):  $e");
      rethrow;
    }
  }
}
