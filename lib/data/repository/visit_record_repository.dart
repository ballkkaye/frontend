class VisitRecordRepository {
  Future<Map<String, dynamic>> getOne(int visitRecordId) async {
    // Response response = await dio.get("${/s/api/visitRecords/{id}/detail}");
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {
        "id": 10,
        "homeTeamName": "두산",
        "awayTeamName": "SSG",
        "homeScore": 3,
        "awayScore": 6,
        "gameDate": "2026.07.06",
        "stadiumName": "사직 야구장",
        "result": "승",
        "content": "역전승 직관! 최고였음!",
        "imageString": "",
      }
    };
    return responseBody;
  }
}
