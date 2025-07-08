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

  Future<Map<String, dynamic>> getSelectGame(String date) async {
    // Response response = await dio.get("${/s/api/games?date=date}");
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {
        "games": [
          {
            "gameDate": date,
            "items": [
              {
                "gameId": 425,
                "homeTeamFullName": "NC 다이노스",
                "homeTeamShortName": "NC",
                "homeTeamScore": 3,
                "awayTeamFullName": "롯데 자이언츠",
                "awayTeamShortName": "롯데",
                "awayTeamScore": 5,
                "stadiumFullName": "창원 NC파크",
                "stadiumShortName": "창원",
                "gameDate": date,
              },
              {
                "gameId": 426,
                "homeTeamFullName": "KT 위즈",
                "homeTeamShortName": "KT",
                "homeTeamScore": 5,
                "awayTeamFullName": "LG 트윈스",
                "awayTeamShortName": "LG",
                "awayTeamScore": 5,
                "stadiumFullName": "수원 KT위즈파크",
                "stadiumShortName": "수원",
                "gameDate": date,
              },
              {
                "gameId": 427,
                "homeTeamFullName": "키움 히어로즈",
                "homeTeamShortName": "키움",
                "homeTeamScore": 2,
                "awayTeamFullName": "KIA 타이거즈",
                "awayTeamShortName": "KIA",
                "awayTeamScore": 0,
                "stadiumFullName": "고척스카이돔",
                "stadiumShortName": "고척",
                "gameDate": date,
              }
            ]
          }
        ],
        "selectedDate": date,
      }
    };
    return responseBody;
  }
}
