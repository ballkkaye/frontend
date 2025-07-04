class VisitRecordRepository {
  Future<Map<String, dynamic>> getOne(int id) async {
    // Response response = await dio.get("${/s/api/visitRecords/{id}/detail}");
    final responseBody = {
      "visitRecordId": 1,
      "result": "패",
      "content": "졌으요",
      "imgs": ["/images/1.png", "/images/2.png"],
      "game": {
        "gameId": 101,
        "date": "2025-06-08",
        "homeTeam": "롯데 자이언츠",
        "awayTeam": "두산 베어스",
        "stadiumName": "사직 야구장",
        "homeScore": 4,
        "awayScore": 7
      }
    };
    print(responseBody);
    return responseBody;
  }
}
