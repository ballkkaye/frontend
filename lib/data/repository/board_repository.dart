import 'package:ballkkaye_frontend/_core/utils/m_http.dart';
import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:ballkkaye_frontend/data/model/team.dart';
import 'package:dio/dio.dart';

class BoardRepository {
  Future<Map<String, dynamic>> getBoardList(String accessToken) async {
    try {
      final response = await dio.get(
        "/s/api/boards",
        options: Options(headers: {
          "Authorization": "Bearer $accessToken",
        }),
      );
      print("API statusCode: ${response.statusCode}");
      print("API data: ${response.data}");

      if (response.statusCode == 200) {
        final body = response.data['body'];
        List<Team> teams = (body['teams'] as List).map((e) => Team.fromJson(e)).toList();
        List<BoardItem> items = (body['items'] as List).map((e) => BoardItem.fromJson(e)).toList();

        for (var item in items) {
          final matched = teams.firstWhere((team) => team.teamId == item.team.teamId);
          item.team = matched;
        }

        return {'teams': teams, 'items': items};
      } else {
        throw Exception("게시판 목록 불러오기 실패: ${response.statusCode}");
      }
    } catch (e) {
      print("BoardRepository Error: $e");
      rethrow;
    }
  }
}
