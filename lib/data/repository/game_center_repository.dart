class GameCenterRepository {
  // 팀순위 조회
  Future<Map<String, dynamic>> getRanking() async {
    // Response response = await dio.get("${/api/today/team-records}");
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": [
        {
          "teamName": "한화 이글스",
          "gap": 0.0,
          "winGame": 46,
          "loseGame": 33,
          "tieGame": 1,
          "totalGame": 80,
          "winRate": 0.582,
          "teamRank": 1,
          "recentTenGame": "4승0무6패",
          "streak": "1패"
        },
        {
          "teamName": "LG 트윈스",
          "gap": 1.0,
          "winGame": 45,
          "loseGame": 34,
          "tieGame": 2,
          "totalGame": 81,
          "winRate": 0.57,
          "teamRank": 2,
          "recentTenGame": "4승0무6패",
          "streak": "1패"
        },
        {
          "teamName": "롯데 자이언츠",
          "gap": 2.0,
          "winGame": 44,
          "loseGame": 35,
          "tieGame": 3,
          "totalGame": 82,
          "winRate": 0.557,
          "teamRank": 3,
          "recentTenGame": "6승0무4패",
          "streak": "1승"
        },
        {
          "teamName": "KIA 타이거즈",
          "gap": 3.5,
          "winGame": 42,
          "loseGame": 36,
          "tieGame": 3,
          "totalGame": 81,
          "winRate": 0.538,
          "teamRank": 4,
          "recentTenGame": "5승2무3패",
          "streak": "1패"
        },
        {
          "teamName": "SSG 랜더스",
          "gap": 5.0,
          "winGame": 40,
          "loseGame": 37,
          "tieGame": 3,
          "totalGame": 80,
          "winRate": 0.519,
          "teamRank": 5,
          "recentTenGame": "5승1무4패",
          "streak": "1승"
        },
        {
          "teamName": "KT 위즈",
          "gap": 5.0,
          "winGame": 41,
          "loseGame": 38,
          "tieGame": 3,
          "totalGame": 82,
          "winRate": 0.519,
          "teamRank": 6,
          "recentTenGame": "5승0무5패",
          "streak": "1승"
        },
        {
          "teamName": "삼성 라이온즈",
          "gap": 6.5,
          "winGame": 40,
          "loseGame": 40,
          "tieGame": 1,
          "totalGame": 81,
          "winRate": 0.5,
          "teamRank": 7,
          "recentTenGame": "2승0무8패",
          "streak": "1패"
        },
        {
          "teamName": "NC 다이노스",
          "gap": 7.5,
          "winGame": 36,
          "loseGame": 38,
          "tieGame": 4,
          "totalGame": 78,
          "winRate": 0.486,
          "teamRank": 8,
          "recentTenGame": "6승0무4패",
          "streak": "1승"
        },
        {
          "teamName": "두산 베어스",
          "gap": 13.5,
          "winGame": 32,
          "loseGame": 46,
          "tieGame": 3,
          "totalGame": 81,
          "winRate": 0.41,
          "teamRank": 9,
          "recentTenGame": "5승0무5패",
          "streak": "1승"
        },
        {
          "teamName": "키움 히어로즈",
          "gap": 21.0,
          "winGame": 26,
          "loseGame": 55,
          "tieGame": 3,
          "totalGame": 84,
          "winRate": 0.321,
          "teamRank": 10,
          "recentTenGame": "5승1무4패",
          "streak": "1패"
        }
      ]
    };
    return responseBody;
  }

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
