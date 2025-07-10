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
                "homeTeamId": 9,
                "homeTeamFullName": "NC 다이노스",
                "homeTeamShortName": "NC",
                "homeTeamScore": 3,
                "awayTeamId": 7,
                "awayTeamFullName": "롯데 자이언츠",
                "awayTeamShortName": "롯데",
                "awayTeamScore": 5,
                "stadiumFullName": "창원 NC파크",
                "stadiumShortName": "창원",
                "gameDate": "2025.07.02"
              },
              {
                "gameId": 426,
                "homeTeamId": 10,
                "homeTeamFullName": "KT 위즈",
                "homeTeamShortName": "KT",
                "homeTeamScore": 5,
                "awayTeamId": 1,
                "awayTeamFullName": "LG 트윈스",
                "awayTeamShortName": "LG",
                "awayTeamScore": 5,
                "stadiumFullName": "수원 KT위즈파크",
                "stadiumShortName": "수원",
                "gameDate": "2025.07.02"
              },
              {
                "gameId": 427,
                "homeTeamId": 3,
                "homeTeamFullName": "키움 히어로즈",
                "homeTeamShortName": "키움",
                "homeTeamScore": 2,
                "awayTeamId": 5,
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
