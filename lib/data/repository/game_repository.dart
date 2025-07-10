import 'package:logger/logger.dart';

class GameRepository {
  Future<Map<String, dynamic>> getList(String date) async {
    Logger().d('GameRepository의 getList의 date: ${date}');
    // Response response = await dio.get("/s/api/games", queryParameters: {"date": date});
    // final responseBody = response.data;
    if (date.startsWith("2025-07-10")) {
      final responseBody = {
        "status": 200,
        "msg": "성공",
        "body": {
          "games": [
            {
              "gameDate": "2025.07.10",
              "items": [
                {
                  "gameId": 425,
                  "homeTeamId": 9,
                  "homeTeamFullName": "NC 다이노스10",
                  "homeTeamShortName": "NC",
                  "homeTeamScore": 3,
                  "awayTeamId": 7,
                  "awayTeamFullName": "롯데 자이언츠10",
                  "awayTeamShortName": "롯데",
                  "awayTeamScore": 5,
                  "stadiumFullName": "창원 NC파크",
                  "stadiumShortName": "창원10",
                  "gameDate": "2025.07.10"
                },
                {
                  "gameId": 426,
                  "homeTeamId": 10,
                  "homeTeamFullName": "KT 위즈10",
                  "homeTeamShortName": "KT",
                  "homeTeamScore": 5,
                  "awayTeamId": 1,
                  "awayTeamFullName": "LG 트윈스10",
                  "awayTeamShortName": "LG",
                  "awayTeamScore": 5,
                  "stadiumFullName": "수원 KT위즈파크",
                  "stadiumShortName": "수원10",
                  "gameDate": "2025.07.10"
                },
                {
                  "gameId": 427,
                  "homeTeamId": 3,
                  "homeTeamFullName": "키움 히어로즈10",
                  "homeTeamShortName": "키움",
                  "homeTeamScore": 2,
                  "awayTeamId": 5,
                  "awayTeamFullName": "KIA 타이거즈10",
                  "awayTeamShortName": "KIA",
                  "awayTeamScore": 0,
                  "stadiumFullName": "고척스카이돔",
                  "stadiumShortName": "고척10",
                  "gameDate": "2025.07.10"
                }
              ]
            }
          ],
          "selectedDate": "2025-07-10"
        }
      };
      Logger().d('GameRepository의 getList: ${responseBody}');
      return responseBody;
    } else if (date.startsWith("2025-07-13")) {
      final responseBody = {
        "status": 200,
        "msg": "성공",
        "body": {
          "games": [
            {
              "gameDate": "2025.07.13",
              "items": [
                {
                  "gameId": 425,
                  "homeTeamId": 9,
                  "homeTeamFullName": "NC 다이노스13",
                  "homeTeamShortName": "NC",
                  "homeTeamScore": 3,
                  "awayTeamId": 7,
                  "awayTeamFullName": "롯데 자이언츠13",
                  "awayTeamShortName": "롯데",
                  "awayTeamScore": 5,
                  "stadiumFullName": "창원 NC파크",
                  "stadiumShortName": "창원13",
                  "gameDate": "2025.07.13"
                },
                {
                  "gameId": 426,
                  "homeTeamId": 10,
                  "homeTeamFullName": "KT 위즈13",
                  "homeTeamShortName": "KT",
                  "homeTeamScore": 5,
                  "awayTeamId": 1,
                  "awayTeamFullName": "LG 트윈스13",
                  "awayTeamShortName": "LG",
                  "awayTeamScore": 5,
                  "stadiumFullName": "수원 KT위즈파크",
                  "stadiumShortName": "수원13",
                  "gameDate": "2025.07.13"
                },
                {
                  "gameId": 427,
                  "homeTeamId": 3,
                  "homeTeamFullName": "키움 히어로즈13",
                  "homeTeamShortName": "키움",
                  "homeTeamScore": 2,
                  "awayTeamId": 5,
                  "awayTeamFullName": "KIA 타이거즈13",
                  "awayTeamShortName": "KIA",
                  "awayTeamScore": 0,
                  "stadiumFullName": "고척스카이돔",
                  "stadiumShortName": "고척13",
                  "gameDate": "2025.07.13"
                }
              ]
            }
          ],
          "selectedDate": "2025-07-13"
        }
      };
      Logger().d('GameRepository의 getList: ${responseBody}');
      return responseBody;
    } else {
      return {"status": 400, "msg": "해당 날짜에 대한 경기 데이터 없음", "body": {}};
    }
  }

  Future<Map<String, dynamic>> getAvailableDateList() async {
    // Response response = await dio.get("/s/api/games/dates");
    // final responseBody = response.data;
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": [
        {
          "year": "2025",
          "monthDTO": [
            {
              "month": "03",
              "day": [
                {"day": "22", "isHaveGame": true},
                {"day": "23", "isHaveGame": true},
                {"day": "24", "isHaveGame": true},
                {"day": "25", "isHaveGame": true},
                {"day": "26", "isHaveGame": true},
                {"day": "27", "isHaveGame": true},
                {"day": "28", "isHaveGame": true},
                {"day": "29", "isHaveGame": true},
                {"day": "30", "isHaveGame": true},
                {"day": "31", "isHaveGame": true}
              ]
            }
          ]
        },
        {
          "year": "2025",
          "monthDTO": [
            {
              "month": "04",
              "day": [
                {"day": "01", "isHaveGame": true},
                {"day": "02", "isHaveGame": true},
                {"day": "03", "isHaveGame": true},
                {"day": "04", "isHaveGame": true},
                {"day": "05", "isHaveGame": true},
                {"day": "06", "isHaveGame": true},
                {"day": "07", "isHaveGame": true},
                {"day": "08", "isHaveGame": true},
                {"day": "09", "isHaveGame": true},
                {"day": "10", "isHaveGame": true},
                {"day": "11", "isHaveGame": true},
                {"day": "12", "isHaveGame": true},
                {"day": "13", "isHaveGame": true},
                {"day": "14", "isHaveGame": true},
                {"day": "15", "isHaveGame": true},
                {"day": "16", "isHaveGame": true},
                {"day": "17", "isHaveGame": true},
                {"day": "18", "isHaveGame": true},
                {"day": "19", "isHaveGame": true},
                {"day": "20", "isHaveGame": true},
                {"day": "21", "isHaveGame": true},
                {"day": "22", "isHaveGame": true},
                {"day": "23", "isHaveGame": true},
                {"day": "24", "isHaveGame": true},
                {"day": "25", "isHaveGame": true},
                {"day": "26", "isHaveGame": true},
                {"day": "27", "isHaveGame": true},
                {"day": "28", "isHaveGame": true},
                {"day": "29", "isHaveGame": true},
                {"day": "30", "isHaveGame": true}
              ]
            }
          ]
        },
        {
          "year": "2025",
          "monthDTO": [
            {
              "month": "05",
              "day": [
                {"day": "01", "isHaveGame": true},
                {"day": "02", "isHaveGame": true},
                {"day": "03", "isHaveGame": true},
                {"day": "04", "isHaveGame": true},
                {"day": "05", "isHaveGame": true},
                {"day": "06", "isHaveGame": true},
                {"day": "07", "isHaveGame": true},
                {"day": "08", "isHaveGame": true},
                {"day": "09", "isHaveGame": true},
                {"day": "10", "isHaveGame": true},
                {"day": "11", "isHaveGame": true},
                {"day": "12", "isHaveGame": true},
                {"day": "13", "isHaveGame": true},
                {"day": "14", "isHaveGame": true},
                {"day": "15", "isHaveGame": true},
                {"day": "16", "isHaveGame": true},
                {"day": "17", "isHaveGame": true},
                {"day": "18", "isHaveGame": true},
                {"day": "19", "isHaveGame": true},
                {"day": "20", "isHaveGame": true},
                {"day": "21", "isHaveGame": true},
                {"day": "22", "isHaveGame": true},
                {"day": "23", "isHaveGame": true},
                {"day": "24", "isHaveGame": true},
                {"day": "25", "isHaveGame": true},
                {"day": "26", "isHaveGame": true},
                {"day": "27", "isHaveGame": true},
                {"day": "28", "isHaveGame": true},
                {"day": "29", "isHaveGame": true},
                {"day": "30", "isHaveGame": true},
                {"day": "31", "isHaveGame": true}
              ]
            }
          ]
        },
        {
          "year": "2025",
          "monthDTO": [
            {
              "month": "06",
              "day": [
                {"day": "01", "isHaveGame": true},
                {"day": "02", "isHaveGame": true},
                {"day": "03", "isHaveGame": true},
                {"day": "04", "isHaveGame": true},
                {"day": "05", "isHaveGame": true},
                {"day": "06", "isHaveGame": true},
                {"day": "07", "isHaveGame": true},
                {"day": "08", "isHaveGame": true},
                {"day": "09", "isHaveGame": true},
                {"day": "10", "isHaveGame": true},
                {"day": "11", "isHaveGame": true},
                {"day": "12", "isHaveGame": true},
                {"day": "13", "isHaveGame": true},
                {"day": "14", "isHaveGame": true},
                {"day": "15", "isHaveGame": true},
                {"day": "16", "isHaveGame": true},
                {"day": "17", "isHaveGame": true},
                {"day": "18", "isHaveGame": true},
                {"day": "19", "isHaveGame": true},
                {"day": "20", "isHaveGame": true},
                {"day": "21", "isHaveGame": true},
                {"day": "22", "isHaveGame": true},
                {"day": "23", "isHaveGame": true},
                {"day": "24", "isHaveGame": true},
                {"day": "25", "isHaveGame": true},
                {"day": "26", "isHaveGame": true},
                {"day": "27", "isHaveGame": true},
                {"day": "28", "isHaveGame": true},
                {"day": "29", "isHaveGame": true},
                {"day": "30", "isHaveGame": true}
              ]
            }
          ]
        },
        {
          "year": "2025",
          "monthDTO": [
            {
              "month": "07",
              "day": [
                {"day": "01", "isHaveGame": true},
                {"day": "02", "isHaveGame": true},
                {"day": "03", "isHaveGame": true},
                {"day": "04", "isHaveGame": true},
                {"day": "05", "isHaveGame": true},
                {"day": "06", "isHaveGame": true},
                {"day": "07", "isHaveGame": true},
                {"day": "08", "isHaveGame": true},
                {"day": "09", "isHaveGame": true},
                {"day": "10", "isHaveGame": true},
                {"day": "11", "isHaveGame": true},
                {"day": "12", "isHaveGame": true},
                {"day": "13", "isHaveGame": true},
                {"day": "14", "isHaveGame": true},
                {"day": "17", "isHaveGame": true},
                {"day": "19", "isHaveGame": true},
                {"day": "20", "isHaveGame": true},
                {"day": "21", "isHaveGame": true},
                {"day": "22", "isHaveGame": true},
                {"day": "23", "isHaveGame": true},
                {"day": "24", "isHaveGame": true},
                {"day": "25", "isHaveGame": true},
                {"day": "26", "isHaveGame": true},
                {"day": "27", "isHaveGame": true},
                {"day": "28", "isHaveGame": true},
                {"day": "29", "isHaveGame": true},
                {"day": "30", "isHaveGame": true},
                {"day": "31", "isHaveGame": true}
              ]
            }
          ]
        },
        {
          "year": "2025",
          "monthDTO": [
            {
              "month": "08",
              "day": [
                {"day": "01", "isHaveGame": true},
                {"day": "02", "isHaveGame": true},
                {"day": "03", "isHaveGame": true},
                {"day": "04", "isHaveGame": true},
                {"day": "05", "isHaveGame": true},
                {"day": "06", "isHaveGame": true},
                {"day": "07", "isHaveGame": true},
                {"day": "08", "isHaveGame": true},
                {"day": "09", "isHaveGame": true},
                {"day": "10", "isHaveGame": true},
                {"day": "11", "isHaveGame": true},
                {"day": "15", "isHaveGame": true},
                {"day": "16", "isHaveGame": true},
                {"day": "17", "isHaveGame": true},
                {"day": "18", "isHaveGame": true},
                {"day": "19", "isHaveGame": true},
                {"day": "20", "isHaveGame": true},
                {"day": "21", "isHaveGame": true},
                {"day": "22", "isHaveGame": true},
                {"day": "23", "isHaveGame": true},
                {"day": "24", "isHaveGame": true},
                {"day": "25", "isHaveGame": true},
                {"day": "26", "isHaveGame": true},
                {"day": "27", "isHaveGame": true},
                {"day": "28", "isHaveGame": true},
                {"day": "29", "isHaveGame": true},
                {"day": "30", "isHaveGame": true},
                {"day": "31", "isHaveGame": true}
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
