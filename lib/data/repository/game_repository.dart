import 'package:ballkkaye_frontend/_core/utils/m_http.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class GameRepository {
  Future<Map<String, dynamic>> getList(String date) async {
    Logger().d('넘겨받은 date 파라미터: $date');
    Response response =
        await dio.get("/s/api/games", queryParameters: {"date": date});
    //final responseBody = response.data;
    if (date.startsWith("2025-08-02")) {
      final responseBody = {
        "status": 200,
        "msg": "성공",
        "body": {
          "games": [
            {
              "gameDate": "2025.08.02",
              "items": [
                {
                  "gameId": 443,
                  "homeTeamId": 7,
                  "homeTeamFullName": "롯데 자이언츠",
                  "homeTeamShortName": "롯데",
                  "homeTeamScore": null,
                  "awayTeamId": 9,
                  "awayTeamFullName": "NC 다이노스",
                  "awayTeamShortName": "NC",
                  "awayTeamScore": null,
                  "stadiumFullName": "창원 NC파크",
                  "stadiumShortName": "창원",
                  "gameDate": "2025.08.02"
                },
                {
                  "gameId": 444,
                  "homeTeamId": 1,
                  "homeTeamFullName": "LG 트윈스",
                  "homeTeamShortName": "LG",
                  "homeTeamScore": null,
                  "awayTeamId": 10,
                  "awayTeamFullName": "KT 위즈",
                  "awayTeamShortName": "KT",
                  "awayTeamScore": null,
                  "stadiumFullName": "수원 KT위즈파크",
                  "stadiumShortName": "수원",
                  "gameDate": "2025.08.02"
                }
              ]
            }
          ],
          "selectedDate": "2025-08-02"
        }
      };
      Logger().d('GameRepository의 getList: ${responseBody}');
      return responseBody;
    } else if (date.startsWith("2025-08-03")) {
      final responseBody = {
        "status": 200,
        "msg": "성공",
        "body": {
          "games": [
            {
              "gameDate": "2025.08.03",
              "items": [
                {
                  "gameId": 445,
                  "homeTeamId": 3,
                  "homeTeamFullName": "키움 히어로즈",
                  "homeTeamShortName": "키움",
                  "homeTeamScore": null,
                  "awayTeamId": 5,
                  "awayTeamFullName": "KIA 타이거즈",
                  "awayTeamShortName": "KIA",
                  "awayTeamScore": null,
                  "stadiumFullName": "고척스카이돔",
                  "stadiumShortName": "고척",
                  "gameDate": "2025.08.03"
                },
                {
                  "gameId": 446,
                  "homeTeamId": 2,
                  "homeTeamFullName": "두산 베어스",
                  "homeTeamShortName": "두산",
                  "homeTeamScore": null,
                  "awayTeamId": 6,
                  "awayTeamFullName": "삼성 라이온즈",
                  "awayTeamShortName": "삼성",
                  "awayTeamScore": null,
                  "stadiumFullName": "잠실야구장",
                  "stadiumShortName": "잠실",
                  "gameDate": "2025.08.03"
                }
              ]
            }
          ],
          "selectedDate": "2025-08-03"
        }
      };
      Logger().d('GameRepository의 getList: ${responseBody}');
      return responseBody;
    } else {
      return {"status": 400, "msg": "해당 날짜에 대한 경기 데이터 없음", "body": {}};
    }
    // Logger().d('GameRepository의 getList: ${responseBody}');
    // return responseBody;
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
