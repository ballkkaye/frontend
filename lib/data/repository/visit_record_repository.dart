import 'package:logger/logger.dart';

class VisitRecordRepository {
  // 상세보기 조회
  Future<Map<String, dynamic>> getOne(int visitRecordId) async {
    // Response response = await dio.get("${/s/api/visitRecords/{id}/detail}");
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {
        "imageString": "https://example.com/visit-photo.jpg",
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
  Future<Map<String, dynamic>> getMonthGameList(
      {required int year, required int month}) async {
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

  // select 경기 리스트 조회
  Future<Map<String, dynamic>> getGameList(String date) async {
    // Response response = await dio.get("${/s/api/games}");
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {
        "games": [
          {
            "gameDate": "2025.07.14",
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
                "gameDate": "2025.07.14"
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
                "gameDate": "2025.07.14"
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
                "gameDate": "2025.07.14"
              }
            ]
          }
        ],
        "selectedDate": "2025-07-14"
      }
    };
    return responseBody;
  }

  // select 경기가 있는 날짜 조회
  Future<Map<String, dynamic>> getHasGameDay(String date) async {
    // Response response = await dio.get("${/s/api/games/dates}");
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": [
        {
          "year": "2025",
          "monthDTO": [
            {
              "month": "07",
              "day": [
                {"day": "02", "isHaveGame": true},
                {"day": "03", "isHaveGame": true},
                {"day": "04", "isHaveGame": true},
                {"day": "05", "isHaveGame": true}
              ]
            }
          ]
        }
      ]
    };
    return responseBody;
  }

  Future<Map<String, dynamic>> write(Map<String, dynamic> data) async {
    // Response response = await dio.post("/s/api/visit-records", data: data);
    // final responseBody = response.data;
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {
        "id": 4,
        "homeTeamName": "두산",
        "awayTeamName": "SSG",
        "homeScore": 3,
        "awayScore": 5,
        "gameDate": "2025.07.05",
        "stadiumName": "잠실야구장",
        "result": "승",
        "content": "응원 열심히 했고, 분위기 최고였어요!",
        "imgUrl": "https://example.com/visit-photo.jpg",
        "deleteStatus": "정상"
      }
    };
    Logger().d(responseBody);
    return responseBody;
  }
}
