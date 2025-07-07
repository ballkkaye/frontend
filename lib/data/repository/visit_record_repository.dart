class VisitRecordRepository {
  Future<Map<String, dynamic>> getOne(int visitRecordId) async {
    // Response response = await dio.get("${/s/api/visitRecords/{id}/detail}");
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {
        "imageString": [],
        "id": 1,
        "homeTeamName": "두산",
        "awayTeamName": "SSG",
        "homeScore": 3,
        "awayScore": 5,
        "gameDate": "2025.07.05",
        "stadiumName": "잠실야구장",
        "result": "승",
        "content": "오늘 직관 진짜 미쳤음. 9회말 역전타 감동ㅠㅠ"
      }
    };
    return responseBody;
  }
}
