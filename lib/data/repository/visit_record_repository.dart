class VisitRecordRepository {
  // 상세보기 조회
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

  // 선택된 날짜 직관기록 리스트
  Future<Map<String, dynamic>> getDayGameList(String date) async {
    // Response response = await dio.get("${/s/api/visitRecords}");
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": [
        {
          "id": 2,
          "homeTeamName": "키움",
          "awayTeamName": "KIA",
          "homeScore": 2,
          "awayScore": 0,
          "gameDate": "2025.07.03",
          "stadiumName": "고척스카이돔",
        },
        {
          "id": 1,
          "homeTeamName": "두산",
          "awayTeamName": "SSG",
          "homeScore": 3,
          "awayScore": 5,
          "gameDate": "2025.07.03",
          "stadiumName": "잠실야구장",
        }
      ]
    };
    return responseBody;
  }

  // 선택된 달 직관기록 리스트
  Future<Map<String, dynamic>> getMonthGameList({required int year, required int month}) async {
    // Response response = await dio.get("/s/api/visitRecords",
    // queryParameters: {"year": year, "month": month},);
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": [
        {
          "id": 10,
          "homeTeamName": "두산",
          "awayTeamName": "SSG",
          "homeScore": 3,
          "awayScore": 5,
          "gameDate": "2025.07.05",
          "stadiumName": "잠실아구장",
        },
        {
          "id": 2,
          "homeTeamName": "키움",
          "awayTeamName": "KIA",
          "homeScore": 2,
          "awayScore": 0,
          "gameDate": "2025.07.03",
          "stadiumName": "고척스카이돔",
        },
        {
          "id": 1,
          "homeTeamName": "두산",
          "awayTeamName": "SSG",
          "homeScore": 3,
          "awayScore": 5,
          "gameDate": "2025.07.03",
          "stadiumName": "잠실야구장",
        }
      ]
    };
    return responseBody;
  }
}
