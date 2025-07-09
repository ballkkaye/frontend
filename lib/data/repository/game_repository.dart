import 'package:logger/logger.dart';

class GameRepository {
  Future<Map<String, dynamic>> getList(String date) async {
    // Response response = await dio.get("/s/api/games", queryParameters: {"date": date});
    // final responseBody = response.data;
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {
        "games": [
          {
            "gameDate": "2025.07.02",
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
                "gameDate": "2025.07.02"
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
                "gameDate": "2025.07.02"
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
                "gameDate": "2025.07.02"
              }
            ]
          }
        ],
        "selectedDate": "2025-07-02"
      }
    };
    Logger().d('GameRepository의 getList: ${responseBody}');
    return responseBody;
  }

  Future<Map<String, dynamic>> getAvailableDateList(String date) async {
    // Response response = await dio.get("/s/api/games/dates", queryParameters: {"date": date});
    // final responseBody = response.data;
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
    Logger().d('GameRepository의 getAvailableDateList: ${responseBody}');
    return responseBody;
  }
}
