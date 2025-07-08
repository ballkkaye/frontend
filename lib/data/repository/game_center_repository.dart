class GameCenterRepository {
  Future<Map<String, dynamic>> getStadiumList(int stadiumId) async {
    // Response response = await dio.get("${/api/stadiums}");
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": [
        {"stadiumId": 1, "stadiumName": "잠실야구장"},
        {"stadiumId": 2, "stadiumName": "고척스카이돔"},
        {"stadiumId": 3, "stadiumName": "인천 SSG 랜더스필드"},
        {"stadiumId": 4, "stadiumName": "광주-기아 챔피언스필드"},
        {"stadiumId": 5, "stadiumName": "대구 삼성라이온즈파크"},
        {"stadiumId": 6, "stadiumName": "부산 사직야구장"},
        {"stadiumId": 7, "stadiumName": "대전 한화생명이글스파크"},
        {"stadiumId": 8, "stadiumName": "창원 NC파크"},
        {"stadiumId": 9, "stadiumName": "수원 KT위즈파크"},
        {"stadiumId": 10, "stadiumName": "청주야구장"},
        {"stadiumId": 11, "stadiumName": "울산 문수야구장"},
        {"stadiumId": 12, "stadiumName": "포항야구장"},
        {"stadiumId": 13, "stadiumName": "군산 월명야구장"},
        {"stadiumId": 14, "stadiumName": "부산 사직야구장"}
      ]
    };
    return responseBody;
  }

  Future<Map<String, dynamic>> getWeatherInfo(int stadiumId) async {
    // Response response = await dio.get("${/api/today/weather/{stadiumId}}");
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {
        "location": "서울특별시 잠실동",
        "hourly": [
          {
            "hour": 6,
            "temperature": 26.0,
            "temperatureDiffFromYesterday": "2.0°↑",
            "weatherCode": "맑음",
            "humidity": 85.0,
            "windDirection": "남풍",
            "windSpeed": 1.3
          },
          {
            "hour": 7,
            "temperature": 26.0,
            "temperatureDiffFromYesterday": "어제와 비슷",
            "weatherCode": "맑음",
            "humidity": 85.0,
            "windDirection": "남풍",
            "windSpeed": 1.9
          },
          {
            "hour": 8,
            "temperature": 27.0,
            "temperatureDiffFromYesterday": "어제와 비슷",
            "weatherCode": "맑음",
            "humidity": 85.0,
            "windDirection": "남서풍",
            "windSpeed": 2.2
          },
          {
            "hour": 9,
            "temperature": 27.0,
            "temperatureDiffFromYesterday": "1.0°↓",
            "weatherCode": "맑음",
            "humidity": 80.0,
            "windDirection": "남서풍",
            "windSpeed": 2.6
          },
          {
            "hour": 10,
            "temperature": 28.0,
            "temperatureDiffFromYesterday": "1.0°↓",
            "weatherCode": "맑음",
            "humidity": 80.0,
            "windDirection": "남서풍",
            "windSpeed": 3.0
          },
          {
            "hour": 11,
            "temperature": 28.0,
            "temperatureDiffFromYesterday": "2.0°↓",
            "weatherCode": "맑음",
            "humidity": 70.0,
            "windDirection": "남서풍",
            "windSpeed": 3.4
          },
          {
            "hour": 12,
            "temperature": 29.0,
            "temperatureDiffFromYesterday": "3.0°↓",
            "weatherCode": "맑음",
            "humidity": 70.0,
            "windDirection": "남서풍",
            "windSpeed": 3.5
          },
          {
            "hour": 13,
            "temperature": 30.0,
            "temperatureDiffFromYesterday": "3.0°↓",
            "weatherCode": "맑음",
            "humidity": 65.0,
            "windDirection": "남서풍",
            "windSpeed": 3.8
          },
          {
            "hour": 14,
            "temperature": 31.0,
            "temperatureDiffFromYesterday": "3.0°↓",
            "weatherCode": "맑음",
            "humidity": 65.0,
            "windDirection": "서풍",
            "windSpeed": 4.0
          },
          {
            "hour": 15,
            "temperature": 31.0,
            "temperatureDiffFromYesterday": "2.0°↓",
            "weatherCode": "맑음",
            "humidity": 65.0,
            "windDirection": "서풍",
            "windSpeed": 4.1
          },
          {
            "hour": 16,
            "temperature": 31.0,
            "temperatureDiffFromYesterday": "2.0°↓",
            "weatherCode": "맑음",
            "humidity": 65.0,
            "windDirection": "서풍",
            "windSpeed": 3.8
          },
          {
            "hour": 17,
            "temperature": 31.0,
            "temperatureDiffFromYesterday": "1.0°↓",
            "weatherCode": "맑음",
            "humidity": 65.0,
            "windDirection": "서풍",
            "windSpeed": 3.6
          },
          {
            "hour": 18,
            "temperature": 31.0,
            "temperatureDiffFromYesterday": "어제와 비슷",
            "weatherCode": "맑음",
            "humidity": 65.0,
            "windDirection": "서풍",
            "windSpeed": 2.9
          },
          {
            "hour": 19,
            "temperature": 30.0,
            "temperatureDiffFromYesterday": "2.0°↑",
            "weatherCode": "맑음",
            "humidity": 70.0,
            "windDirection": "서풍",
            "windSpeed": 2.0
          },
          {
            "hour": 20,
            "temperature": 29.0,
            "temperatureDiffFromYesterday": "2.0°↑",
            "weatherCode": "맑음",
            "humidity": 75.0,
            "windDirection": "서풍",
            "windSpeed": 1.6
          },
          {
            "hour": 21,
            "temperature": 28.0,
            "temperatureDiffFromYesterday": "2.0°↑",
            "weatherCode": "맑음",
            "humidity": 80.0,
            "windDirection": "서풍",
            "windSpeed": 1.3
          },
          {
            "hour": 22,
            "temperature": 28.0,
            "temperatureDiffFromYesterday": "2.0°↑",
            "weatherCode": "맑음",
            "humidity": 80.0,
            "windDirection": "서풍",
            "windSpeed": 0.8
          },
          {
            "hour": 23,
            "temperature": 27.0,
            "temperatureDiffFromYesterday": "2.0°↑",
            "weatherCode": "맑음",
            "humidity": 85.0,
            "windDirection": "서풍",
            "windSpeed": 0.5
          }
        ],
        "hourlyRain": [
          {"hour": 6, "rainPer": 20.0, "rainAmount": 0.0},
          {"hour": 7, "rainPer": 20.0, "rainAmount": 0.0},
          {"hour": 8, "rainPer": 30.0, "rainAmount": 0.0},
          {"hour": 9, "rainPer": 30.0, "rainAmount": 0.0},
          {"hour": 10, "rainPer": 30.0, "rainAmount": 0.0},
          {"hour": 11, "rainPer": 30.0, "rainAmount": 0.0},
          {"hour": 12, "rainPer": 30.0, "rainAmount": 0.0},
          {"hour": 13, "rainPer": 30.0, "rainAmount": 0.0},
          {"hour": 14, "rainPer": 20.0, "rainAmount": 0.0},
          {"hour": 15, "rainPer": 20.0, "rainAmount": 0.0},
          {"hour": 16, "rainPer": 0.0, "rainAmount": 0.0},
          {"hour": 17, "rainPer": 0.0, "rainAmount": 0.0},
          {"hour": 18, "rainPer": 0.0, "rainAmount": 0.0},
          {"hour": 19, "rainPer": 0.0, "rainAmount": 0.0},
          {"hour": 20, "rainPer": 20.0, "rainAmount": 0.0},
          {"hour": 21, "rainPer": 0.0, "rainAmount": 0.0},
          {"hour": 22, "rainPer": 0.0, "rainAmount": 0.0},
          {"hour": 23, "rainPer": 0.0, "rainAmount": 0.0}
        ],
        "message": "우천취소 가능성 낮음"
      }
    };
    return responseBody;
  }
}
