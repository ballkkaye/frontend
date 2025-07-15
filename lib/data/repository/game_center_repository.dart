import 'package:ballkkaye_frontend/_core/utils/m_http.dart';
import 'package:ballkkaye_frontend/_core/utils/m_util.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class GameCenterRepository {
  // 팀순위 조회
  Future<Map<String, dynamic>> getRanking() async {
    Response response = await dio.get("/s/api/today/team-records");
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": [
    //     {
    //       "teamName": "한화 이글스",
    //       "gap": 0.0,
    //       "winGame": 46,
    //       "loseGame": 33,
    //       "tieGame": 1,
    //       "totalGame": 80,
    //       "winRate": 0.582,
    //       "teamRank": 1,
    //       "recentTenGame": "4승0무6패",
    //       "streak": "1패"
    //     },
    //     {
    //       "teamName": "LG 트윈스",
    //       "gap": 1.0,
    //       "winGame": 45,
    //       "loseGame": 34,
    //       "tieGame": 2,
    //       "totalGame": 81,
    //       "winRate": 0.57,
    //       "teamRank": 2,
    //       "recentTenGame": "4승0무6패",
    //       "streak": "1패"
    //     },
    //     {
    //       "teamName": "롯데 자이언츠",
    //       "gap": 2.0,
    //       "winGame": 44,
    //       "loseGame": 35,
    //       "tieGame": 3,
    //       "totalGame": 82,
    //       "winRate": 0.557,
    //       "teamRank": 3,
    //       "recentTenGame": "6승0무4패",
    //       "streak": "1승"
    //     },
    //     {
    //       "teamName": "KIA 타이거즈",
    //       "gap": 3.5,
    //       "winGame": 42,
    //       "loseGame": 36,
    //       "tieGame": 3,
    //       "totalGame": 81,
    //       "winRate": 0.538,
    //       "teamRank": 4,
    //       "recentTenGame": "5승2무3패",
    //       "streak": "1패"
    //     },
    //     {
    //       "teamName": "SSG 랜더스",
    //       "gap": 5.0,
    //       "winGame": 40,
    //       "loseGame": 37,
    //       "tieGame": 3,
    //       "totalGame": 80,
    //       "winRate": 0.519,
    //       "teamRank": 5,
    //       "recentTenGame": "5승1무4패",
    //       "streak": "1승"
    //     },
    //     {
    //       "teamName": "KT 위즈",
    //       "gap": 5.0,
    //       "winGame": 41,
    //       "loseGame": 38,
    //       "tieGame": 3,
    //       "totalGame": 82,
    //       "winRate": 0.519,
    //       "teamRank": 6,
    //       "recentTenGame": "5승0무5패",
    //       "streak": "1승"
    //     },
    //     {
    //       "teamName": "삼성 라이온즈",
    //       "gap": 6.5,
    //       "winGame": 40,
    //       "loseGame": 40,
    //       "tieGame": 1,
    //       "totalGame": 81,
    //       "winRate": 0.5,
    //       "teamRank": 7,
    //       "recentTenGame": "2승0무8패",
    //       "streak": "1패"
    //     },
    //     {
    //       "teamName": "NC 다이노스",
    //       "gap": 7.5,
    //       "winGame": 36,
    //       "loseGame": 38,
    //       "tieGame": 4,
    //       "totalGame": 78,
    //       "winRate": 0.486,
    //       "teamRank": 8,
    //       "recentTenGame": "6승0무4패",
    //       "streak": "1승"
    //     },
    //     {
    //       "teamName": "두산 베어스",
    //       "gap": 13.5,
    //       "winGame": 32,
    //       "loseGame": 46,
    //       "tieGame": 3,
    //       "totalGame": 81,
    //       "winRate": 0.41,
    //       "teamRank": 9,
    //       "recentTenGame": "5승0무5패",
    //       "streak": "1승"
    //     },
    //     {
    //       "teamName": "키움 히어로즈",
    //       "gap": 21.0,
    //       "winGame": 26,
    //       "loseGame": 55,
    //       "tieGame": 3,
    //       "totalGame": 84,
    //       "winRate": 0.321,
    //       "teamRank": 10,
    //       "recentTenGame": "5승1무4패",
    //       "streak": "1패"
    //     }
    //   ]
    // };
    Logger().d("GameCenterRepository getRanking : $responseBody");
    return responseBody;
  }

  // 우천 취소 예측용
  Future<Map<String, dynamic>> getStadiumList(int stadiumId) async {
    Response response = await dio.get("/api/stadiums");
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": [
    //     {"stadiumId": 1, "stadiumName": "잠실야구장"},
    //     {"stadiumId": 2, "stadiumName": "고척스카이돔"},
    //     {"stadiumId": 3, "stadiumName": "인천 SSG 랜더스필드"},
    //     {"stadiumId": 4, "stadiumName": "광주-기아 챔피언스필드"},
    //     {"stadiumId": 5, "stadiumName": "대구 삼성라이온즈파크"},
    //     {"stadiumId": 6, "stadiumName": "부산 사직야구장"},
    //     {"stadiumId": 7, "stadiumName": "대전 한화생명이글스파크"},
    //     {"stadiumId": 8, "stadiumName": "창원 NC파크"},
    //     {"stadiumId": 9, "stadiumName": "수원 KT위즈파크"},
    //     {"stadiumId": 10, "stadiumName": "청주야구장"},
    //     {"stadiumId": 11, "stadiumName": "울산 문수야구장"},
    //     {"stadiumId": 12, "stadiumName": "포항야구장"},
    //     {"stadiumId": 13, "stadiumName": "군산 월명야구장"},
    //     {"stadiumId": 14, "stadiumName": "부산 사직야구장"}
    //   ]
    // };
    Logger().d("GameCenterRepository getStadiumList : $responseBody");
    return responseBody;
  }

  // 우천 취소 예측
  Future<Map<String, dynamic>> getWeatherInfo(int stadiumId) async {
    Response response = await dio.get("/api/today/weather/$stadiumId");
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": {
    //     "location": "서울특별시 잠실동",
    //     "hourly": [
    //       {
    //         "hour": 6,
    //         "temperature": 26.0,
    //         "temperatureDiffFromYesterday": "2.0°↑",
    //         "weatherCode": "맑음",
    //         "humidity": 85.0,
    //         "windDirection": "남풍",
    //         "windSpeed": 1.3
    //       },
    //       {
    //         "hour": 7,
    //         "temperature": 26.0,
    //         "temperatureDiffFromYesterday": "어제와 비슷",
    //         "weatherCode": "맑음",
    //         "humidity": 85.0,
    //         "windDirection": "남풍",
    //         "windSpeed": 1.9
    //       },
    //       {
    //         "hour": 8,
    //         "temperature": 27.0,
    //         "temperatureDiffFromYesterday": "어제와 비슷",
    //         "weatherCode": "맑음",
    //         "humidity": 85.0,
    //         "windDirection": "남서풍",
    //         "windSpeed": 2.2
    //       },
    //       {
    //         "hour": 9,
    //         "temperature": 27.0,
    //         "temperatureDiffFromYesterday": "1.0°↓",
    //         "weatherCode": "맑음",
    //         "humidity": 80.0,
    //         "windDirection": "남서풍",
    //         "windSpeed": 2.6
    //       },
    //       {
    //         "hour": 10,
    //         "temperature": 28.0,
    //         "temperatureDiffFromYesterday": "1.0°↓",
    //         "weatherCode": "맑음",
    //         "humidity": 80.0,
    //         "windDirection": "남서풍",
    //         "windSpeed": 3.0
    //       },
    //       {
    //         "hour": 11,
    //         "temperature": 28.0,
    //         "temperatureDiffFromYesterday": "2.0°↓",
    //         "weatherCode": "맑음",
    //         "humidity": 70.0,
    //         "windDirection": "남서풍",
    //         "windSpeed": 3.4
    //       },
    //       {
    //         "hour": 12,
    //         "temperature": 29.0,
    //         "temperatureDiffFromYesterday": "3.0°↓",
    //         "weatherCode": "맑음",
    //         "humidity": 70.0,
    //         "windDirection": "남서풍",
    //         "windSpeed": 3.5
    //       },
    //       {
    //         "hour": 13,
    //         "temperature": 30.0,
    //         "temperatureDiffFromYesterday": "3.0°↓",
    //         "weatherCode": "맑음",
    //         "humidity": 65.0,
    //         "windDirection": "남서풍",
    //         "windSpeed": 3.8
    //       },
    //       {
    //         "hour": 14,
    //         "temperature": 31.0,
    //         "temperatureDiffFromYesterday": "3.0°↓",
    //         "weatherCode": "맑음",
    //         "humidity": 65.0,
    //         "windDirection": "서풍",
    //         "windSpeed": 4.0
    //       },
    //       {
    //         "hour": 15,
    //         "temperature": 31.0,
    //         "temperatureDiffFromYesterday": "2.0°↓",
    //         "weatherCode": "맑음",
    //         "humidity": 65.0,
    //         "windDirection": "서풍",
    //         "windSpeed": 4.1
    //       },
    //       {
    //         "hour": 16,
    //         "temperature": 31.0,
    //         "temperatureDiffFromYesterday": "2.0°↓",
    //         "weatherCode": "맑음",
    //         "humidity": 65.0,
    //         "windDirection": "서풍",
    //         "windSpeed": 3.8
    //       },
    //       {
    //         "hour": 17,
    //         "temperature": 31.0,
    //         "temperatureDiffFromYesterday": "1.0°↓",
    //         "weatherCode": "맑음",
    //         "humidity": 65.0,
    //         "windDirection": "서풍",
    //         "windSpeed": 3.6
    //       },
    //       {
    //         "hour": 18,
    //         "temperature": 31.0,
    //         "temperatureDiffFromYesterday": "어제와 비슷",
    //         "weatherCode": "맑음",
    //         "humidity": 65.0,
    //         "windDirection": "서풍",
    //         "windSpeed": 2.9
    //       },
    //       {
    //         "hour": 19,
    //         "temperature": 30.0,
    //         "temperatureDiffFromYesterday": "2.0°↑",
    //         "weatherCode": "맑음",
    //         "humidity": 70.0,
    //         "windDirection": "서풍",
    //         "windSpeed": 2.0
    //       },
    //       {
    //         "hour": 20,
    //         "temperature": 29.0,
    //         "temperatureDiffFromYesterday": "2.0°↑",
    //         "weatherCode": "맑음",
    //         "humidity": 75.0,
    //         "windDirection": "서풍",
    //         "windSpeed": 1.6
    //       },
    //       {
    //         "hour": 21,
    //         "temperature": 28.0,
    //         "temperatureDiffFromYesterday": "2.0°↑",
    //         "weatherCode": "맑음",
    //         "humidity": 80.0,
    //         "windDirection": "서풍",
    //         "windSpeed": 1.3
    //       },
    //       {
    //         "hour": 22,
    //         "temperature": 28.0,
    //         "temperatureDiffFromYesterday": "2.0°↑",
    //         "weatherCode": "맑음",
    //         "humidity": 80.0,
    //         "windDirection": "서풍",
    //         "windSpeed": 0.8
    //       },
    //       {
    //         "hour": 23,
    //         "temperature": 27.0,
    //         "temperatureDiffFromYesterday": "2.0°↑",
    //         "weatherCode": "맑음",
    //         "humidity": 85.0,
    //         "windDirection": "서풍",
    //         "windSpeed": 0.5
    //       }
    //     ],
    //     "hourlyRain": [
    //       {"hour": 6, "rainPer": 20.0, "rainAmount": 0.0},
    //       {"hour": 7, "rainPer": 20.0, "rainAmount": 0.0},
    //       {"hour": 8, "rainPer": 30.0, "rainAmount": 0.0},
    //       {"hour": 9, "rainPer": 30.0, "rainAmount": 0.0},
    //       {"hour": 10, "rainPer": 30.0, "rainAmount": 0.0},
    //       {"hour": 11, "rainPer": 30.0, "rainAmount": 0.0},
    //       {"hour": 12, "rainPer": 30.0, "rainAmount": 0.0},
    //       {"hour": 13, "rainPer": 30.0, "rainAmount": 0.0},
    //       {"hour": 14, "rainPer": 20.0, "rainAmount": 0.0},
    //       {"hour": 15, "rainPer": 20.0, "rainAmount": 0.0},
    //       {"hour": 16, "rainPer": 0.0, "rainAmount": 0.0},
    //       {"hour": 17, "rainPer": 0.0, "rainAmount": 0.0},
    //       {"hour": 18, "rainPer": 0.0, "rainAmount": 0.0},
    //       {"hour": 19, "rainPer": 0.0, "rainAmount": 0.0},
    //       {"hour": 20, "rainPer": 20.0, "rainAmount": 0.0},
    //       {"hour": 21, "rainPer": 0.0, "rainAmount": 0.0},
    //       {"hour": 22, "rainPer": 0.0, "rainAmount": 0.0},
    //       {"hour": 23, "rainPer": 0.0, "rainAmount": 0.0}
    //     ],
    //     "message": "우천취소 가능성 낮음"
    //   }
    // };
    Logger().d("GameCenterRepository getWeatherInfo : $responseBody");
    return responseBody;
  }

  // 상대 전적 확인
  Future<Map<String, dynamic>> getMatchup({required int gameId, required int teamId}) async {
    Response response = await dio.get(
      "/api/today/hitter-lineup",
      queryParameters: {"gameId": gameId, "teamId": teamId},
    );
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": {
    //     "gameId": 423,
    //     "season": 2025,
    //     "hitters": [
    //       {
    //         "hitPredictionPer": 29.1,
    //         "teamId": 2,
    //         "hitterOrder": 1,
    //         "name": "홍성우",
    //         "position": "1루수",
    //         "ab": 3,
    //         "h": 1,
    //         "avg": 0.333,
    //         "ops": 0.821
    //       },
    //       {
    //         "hitPredictionPer": 34.3,
    //         "teamId": 2,
    //         "hitterOrder": 2,
    //         "name": "박정호",
    //         "position": "2루수",
    //         "ab": 4,
    //         "h": 2,
    //         "avg": 0.5,
    //         "ops": 0.92
    //       },
    //       {
    //         "hitPredictionPer": 31.6,
    //         "teamId": 2,
    //         "hitterOrder": 3,
    //         "name": "이재원",
    //         "position": "3루수",
    //         "ab": 2,
    //         "h": 1,
    //         "avg": 0.5,
    //         "ops": 0.85
    //       },
    //       {
    //         "hitPredictionPer": 21.3,
    //         "teamId": 2,
    //         "hitterOrder": 4,
    //         "name": "정우영",
    //         "position": "유격수",
    //         "ab": 3,
    //         "h": 0,
    //         "avg": 0.0,
    //         "ops": 0.65
    //       },
    //       {
    //         "hitPredictionPer": 36.5,
    //         "teamId": 2,
    //         "hitterOrder": 5,
    //         "name": "최재훈",
    //         "position": "좌익수",
    //         "ab": 3,
    //         "h": 2,
    //         "avg": 0.667,
    //         "ops": 0.94
    //       },
    //       {
    //         "hitPredictionPer": 27.3,
    //         "teamId": 2,
    //         "hitterOrder": 6,
    //         "name": "김재현",
    //         "position": "중견수",
    //         "ab": 4,
    //         "h": 1,
    //         "avg": 0.25,
    //         "ops": 0.77
    //       },
    //       {
    //         "hitPredictionPer": 31.7,
    //         "teamId": 2,
    //         "hitterOrder": 7,
    //         "name": "류지혁",
    //         "position": "우익수",
    //         "ab": 2,
    //         "h": 1,
    //         "avg": 0.5,
    //         "ops": 0.865
    //       },
    //       {
    //         "hitPredictionPer": 27.0,
    //         "teamId": 2,
    //         "hitterOrder": 8,
    //         "name": "한지민",
    //         "position": "포수",
    //         "ab": 3,
    //         "h": 1,
    //         "avg": 0.333,
    //         "ops": 0.745
    //       },
    //       {
    //         "hitPredictionPer": 20.9,
    //         "teamId": 2,
    //         "hitterOrder": 9,
    //         "name": "노성현",
    //         "position": "지명타자",
    //         "ab": 3,
    //         "h": 0,
    //         "avg": 0.0,
    //         "ops": 0.68
    //       }
    //     ],
    //     "profileUrl": "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/51867.png",
    //     "name": "김건우",
    //     "gameCount": 27,
    //     "result": "2승 3패",
    //     "era": 4.58,
    //     "whip": 1.53,
    //     "qs": 0
    //   }
    // };
    Logger().d("GameCenterRepository getMatchup : $responseBody");
    return responseBody;
  }

  // 오늘의 경기 조회
  Future<Map<String, dynamic>> getTodayGame({String? date}) async {
    final formattedDate = date ?? formatDateToStr(today); // date 없으면 무조건 오늘 날짜로 조회
    Response response =
        await dio.get("/s/api/today-games", queryParameters: {"date": formattedDate});
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": [
    //     {
    //       "gameId": 423,
    //       "gameStatus": "SCHEDULED",
    //       "gameTime": "18:30",
    //       "stadiumShortName": "잠실",
    //       "broadcastChannel": "MS_T",
    //       "homePitcherName": "콜어빈",
    //       "homeTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/0/09/Doosan_Bears.png",
    //       "awayPitcherName": "김건우",
    //       "awayTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/0/02/SSG_Landers.png",
    //       "ticketLink":
    //           "https://ticket.interpark.com/Contents/Sports/GoodsInfo?SportsCode=07001&TeamCode=PB004"
    //     },
    //     {
    //       "gameId": 424,
    //       "gameStatus": "SCHEDULED",
    //       "gameTime": "18:30",
    //       "stadiumShortName": "대구",
    //       "broadcastChannel": "KN_T",
    //       "homePitcherName": "가라비토",
    //       "homeTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/9/95/Samsung_Lions.png",
    //       "awayPitcherName": "문동주",
    //       "awayTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/9/99/Hanwha_Eagles.png",
    //       "ticketLink": "https://www.ticketlink.co.kr/sports#reservation"
    //     },
    //     {
    //       "gameId": 425,
    //       "gameStatus": "SCHEDULED",
    //       "gameTime": "18:30",
    //       "stadiumShortName": "창원",
    //       "broadcastChannel": "SS_T",
    //       "homePitcherName": "최성영",
    //       "homeTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/b/bd/NC_Dinos.png",
    //       "awayPitcherName": "감보아",
    //       "awayTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/9/91/Lotte_Giants.png",
    //       "ticketLink": "https://ticket.ncdinos.com/login"
    //     },
    //     {
    //       "gameId": 426,
    //       "gameStatus": "SCHEDULED",
    //       "gameTime": "18:30",
    //       "stadiumShortName": "수원",
    //       "broadcastChannel": "SPO_T",
    //       "homePitcherName": "소형준",
    //       "homeTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/b/b3/KT_Wiz.png",
    //       "awayPitcherName": "임찬규",
    //       "awayTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/4/4f/LG_Twins.png",
    //       "ticketLink": "https://www.ktwiz.co.kr/ticket/reservation"
    //     },
    //     {
    //       "gameId": 427,
    //       "gameStatus": "SCHEDULED",
    //       "gameTime": "18:30",
    //       "stadiumShortName": "고척",
    //       "broadcastChannel": "SPO_2T",
    //       "homePitcherName": "하영민",
    //       "homeTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/5/52/Kiwoom_Heroes.png",
    //       "awayPitcherName": "김건국",
    //       "awayTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/6/6e/KIA_Tigers.png",
    //       "ticketLink":
    //           "https://ticket.interpark.com/Contents/Sports/GoodsInfo?SportsCode=07001&TeamCode=PB003"
    //     }
    //   ]
    // };
    Logger().d("GameCenterRepository getTodayGame : $responseBody");
    return responseBody;
  }

  // 승리 예측 조회
  Future<Map<String, dynamic>> getPrediction() async {
    Response response = await dio.get("/s/api/today-games/prediction");
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": [
    //     {
    //       "gameId": 423,
    //       "homeTeamId": 1,
    //       "homeTeamName": "두산 베어스",
    //       "awayTeamId": 2,
    //       "awayTeamName": "SSG 랜더스",
    //       "homePitcherName": "콜어빈",
    //       "awayPitcherName": "김건우",
    //       "homePitcherProfileUrl":
    //           "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/55257.png",
    //       "awayPitcherProfileUrl":
    //           "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/51867.png",
    //       "homePredictionScore": 4.2,
    //       "awayPredictionScore": 3.9,
    //       "totalPredictionScore": 8.1,
    //       "homeWinPercent": 52.0,
    //       "awayWinPercent": 48.0
    //     },
    //     {
    //       "gameId": 424,
    //       "homeTeamName": "삼성 라이온즈",
    //       "awayTeamName": "한화 이글스",
    //       "homePitcherName": "가라비토",
    //       "awayPitcherName": "문동주",
    //       "homePitcherProfileUrl":
    //           "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/55460.png",
    //       "awayPitcherProfileUrl":
    //           "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/52701.png",
    //       "homePredictionScore": 3.7,
    //       "awayPredictionScore": 3.8,
    //       "totalPredictionScore": 7.5,
    //       "homeWinPercent": 49.2,
    //       "awayWinPercent": 50.8
    //     },
    //     {
    //       "gameId": 425,
    //       "homeTeamName": "NC 다이노스",
    //       "awayTeamName": "롯데 자이언츠",
    //       "homePitcherName": "최성영",
    //       "awayPitcherName": "감보아",
    //       "homePitcherProfileUrl":
    //           "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/66920.png",
    //       "awayPitcherProfileUrl":
    //           "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/55532.png",
    //       "homePredictionScore": 4.5,
    //       "awayPredictionScore": 3.6,
    //       "totalPredictionScore": 8.1,
    //       "homeWinPercent": 55.6,
    //       "awayWinPercent": 44.4
    //     },
    //     {
    //       "gameId": 426,
    //       "homeTeamName": "KT 위즈",
    //       "awayTeamName": "LG 트윈스",
    //       "homePitcherName": "소형준",
    //       "awayPitcherName": "임찬규",
    //       "homePitcherProfileUrl":
    //           "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/50030.png",
    //       "awayPitcherProfileUrl":
    //           "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/61101.png",
    //       "homePredictionScore": 3.8,
    //       "awayPredictionScore": 3.8,
    //       "totalPredictionScore": 7.6,
    //       "homeWinPercent": 50.0,
    //       "awayWinPercent": 50.0
    //     },
    //     {
    //       "gameId": 427,
    //       "homeTeamName": "키움 히어로즈",
    //       "awayTeamName": "KIA 타이거즈",
    //       "homePitcherName": "하영민",
    //       "awayPitcherName": "김건국",
    //       "homePitcherProfileUrl":
    //           "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/64350.png",
    //       "awayPitcherProfileUrl":
    //           "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/76225.png",
    //       "homePredictionScore": 3.5,
    //       "awayPredictionScore": 3.9,
    //       "totalPredictionScore": 7.4,
    //       "homeWinPercent": 47.6,
    //       "awayWinPercent": 52.4
    //     }
    //   ]
    // };
    Logger().d("GameCenterRepository getPrediction : $responseBody");
    return responseBody;
  }
  // 나의승부예측 진입
  Future<Map<String, dynamic>> getUserPrediction() async {
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": [
        {
          "gameId": 423,
          "gameTime": "19:00",
          "homeTeam": {
            "teamId": 2,
            "teamName": "두산 베어스",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/0/09/Doosan_Bears.png"
          },
          "awayTeam": {
            "teamId": 4,
            "teamName": "SSG 랜더스",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/0/02/SSG_Landers.png"
          },
          "homeVoteRate": 50,
          "awayVoteRate": 50
        },
        {
          "gameId": 425,
          "gameTime": "20:00",
          "homeTeam": {
            "teamId": 9,
            "teamName": "NC 다이노스",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/b/bd/NC_Dinos.png"
          },
          "awayTeam": {
            "teamId": 7,
            "teamName": "롯데 자이언츠",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/9/91/Lotte_Giants.png"
          },
          "homeVoteRate": 50,
          "awayVoteRate": 50
        },
        {
          "gameId": 426,
          "gameTime": "18:00",
          "homeTeam": {
            "teamId": 10,
            "teamName": "KT 위즈",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/b/b3/KT_Wiz.png"
          },
          "awayTeam": {
            "teamId": 1,
            "teamName": "LG 트윈스",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/4/4f/LG_Twins.png"
          },
          "homeVoteRate": 50,
          "awayVoteRate": 50
        },
        {
          "gameId": 427,
          "gameTime": "19:30",
          "homeTeam": {
            "teamId": 3,
            "teamName": "키움 히어로즈",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/5/52/Kiwoom_Heroes.png"
          },
          "awayTeam": {
            "teamId": 5,
            "teamName": "KIA 타이거즈",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/6/6e/KIA_Tigers.png"
          },
          "homeVoteRate": 50,
          "awayVoteRate": 50
        }
      ]
    };
    return responseBody;
  }

  Future<Map<String, dynamic>> sendPrediction(List<Map<String, dynamic>> predictions) async {
    final responseBody ={
      "status": 200,
      "msg": "성공",
      "body": [
        {
          "gameId": 423,
          "userChoiceTeamId": 2
        },
        {
          "gameId": 424,
          "userChoiceTeamId": 6
        },
        {
          "gameId": 425,
          "userChoiceTeamId": 9
        },
        {
          "gameId": 426,
          "userChoiceTeamId": 10
        },
        {
          "gameId": 427,
          "userChoiceTeamId": 5
        }
      ]
    };
    return responseBody;
  }

  Future<Map<String, dynamic>> getMyPrediction() async {
    final responseBody ={
      "status": 200,
      "msg": "성공",
      "body": [
        {
          "gameId": 423,
          "gameTime": "19:00",
          "homeTeam": {
            "teamId": 2,
            "teamName": "두산 베어스",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/0/09/Doosan_Bears.png"
          },
          "awayTeam": {
            "teamId": 4,
            "teamName": "SSG 랜더스",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/0/02/SSG_Landers.png"
          },
          "homeScore": null,
          "awayScore": null,
          "userChoiceTeamId": 2,
          "predictionStatus": "WAITING",
          "homeVoteRate": 100,
          "awayVoteRate": 0,
          "gameStatus": "SCHEDULED",
          "updatedAt": null
        },
        {
          "gameId": 424,
          "gameTime": "17:30",
          "homeTeam": {
            "teamId": 6,
            "teamName": "삼성 라이온즈",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/9/95/Samsung_Lions.png"
          },
          "awayTeam": {
            "teamId": 8,
            "teamName": "한화 이글스",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/9/99/Hanwha_Eagles.png"
          },
          "homeScore": null,
          "awayScore": null,
          "userChoiceTeamId": 6,
          "predictionStatus": "WAITING",
          "homeVoteRate": 100,
          "awayVoteRate": 0,
          "gameStatus": "SCHEDULED",
          "updatedAt": null
        },
        {
          "gameId": 425,
          "gameTime": "20:00",
          "homeTeam": {
            "teamId": 9,
            "teamName": "NC 다이노스",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/b/bd/NC_Dinos.png"
          },
          "awayTeam": {
            "teamId": 7,
            "teamName": "롯데 자이언츠",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/9/91/Lotte_Giants.png"
          },
          "homeScore": null,
          "awayScore": null,
          "userChoiceTeamId": 9,
          "predictionStatus": "WAITING",
          "homeVoteRate": 100,
          "awayVoteRate": 0,
          "gameStatus": "SCHEDULED",
          "updatedAt": null
        },
        {
          "gameId": 426,
          "gameTime": "18:00",
          "homeTeam": {
            "teamId": 10,
            "teamName": "KT 위즈",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/b/b3/KT_Wiz.png"
          },
          "awayTeam": {
            "teamId": 1,
            "teamName": "LG 트윈스",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/4/4f/LG_Twins.png"
          },
          "homeScore": null,
          "awayScore": null,
          "userChoiceTeamId": 10,
          "predictionStatus": "WAITING",
          "homeVoteRate": 100,
          "awayVoteRate": 0,
          "gameStatus": "SCHEDULED",
          "updatedAt": null
        },
        {
          "gameId": 427,
          "gameTime": "19:30",
          "homeTeam": {
            "teamId": 3,
            "teamName": "키움 히어로즈",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/5/52/Kiwoom_Heroes.png"
          },
          "awayTeam": {
            "teamId": 5,
            "teamName": "KIA 타이거즈",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/6/6e/KIA_Tigers.png"
          },
          "homeScore": null,
          "awayScore": null,
          "userChoiceTeamId": 5,
          "predictionStatus": "WAITING",
          "homeVoteRate": 0,
          "awayVoteRate": 100,
          "gameStatus": "SCHEDULED",
          "updatedAt": null
        }
      ]
    };
    return responseBody;
  }

  Future<Map<String, dynamic>> getMyPredictionTest() async { //승부 예측 저장 후 (경기 후)
    final responseBody ={
      "status": 200,
      "msg": "성공",
      "body": [
        {
          "gameId": 423,
          "gameTime": "19:00",
          "homeTeam": {
            "teamId": 2,
            "teamName": "두산 베어스",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/0/09/Doosan_Bears.png"
          },
          "awayTeam": {
            "teamId": 4,
            "teamName": "SSG 랜더스",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/0/02/SSG_Landers.png"
          },
          "homeScore": 3,
          "awayScore": 1,
          "userChoiceTeamId": 2,
          "predictionStatus": "CORRECT",
          "homeVoteRate": 100,
          "awayVoteRate": 0,
          "gameStatus": "COMPLETED",
          "updatedAt": "2025-07-07T17:46:53.495039"
        },
        {
          "gameId": 424,
          "gameTime": "17:30",
          "homeTeam": {
            "teamId": 6,
            "teamName": "삼성 라이온즈",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/9/95/Samsung_Lions.png"
          },
          "awayTeam": {
            "teamId": 8,
            "teamName": "한화 이글스",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/9/99/Hanwha_Eagles.png"
          },
          "homeScore": 2,
          "awayScore": 5,
          "userChoiceTeamId": 6,
          "predictionStatus": "INCORRECT",
          "homeVoteRate": 100,
          "awayVoteRate": 0,
          "gameStatus": "COMPLETED",
          "updatedAt": "2025-07-07T17:46:53.495039"
        },
        {
          "gameId": 425,
          "gameTime": "20:00",
          "homeTeam": {
            "teamId": 9,
            "teamName": "NC 다이노스",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/b/bd/NC_Dinos.png"
          },
          "awayTeam": {
            "teamId": 7,
            "teamName": "롯데 자이언츠",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/9/91/Lotte_Giants.png"
          },
          "homeScore": 4,
          "awayScore": 4,
          "userChoiceTeamId": 9,
          "predictionStatus": "TIE",
          "homeVoteRate": 100,
          "awayVoteRate": 0,
          "gameStatus": "COMPLETED",
          "updatedAt": "2025-07-07T17:46:53.495039"
        },
        {
          "gameId": 426,
          "gameTime": "18:00",
          "homeTeam": {
            "teamId": 10,
            "teamName": "KT 위즈",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/b/b3/KT_Wiz.png"
          },
          "awayTeam": {
            "teamId": 1,
            "teamName": "LG 트윈스",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/4/4f/LG_Twins.png"
          },
          "homeScore": 5,
          "awayScore": 2,
          "userChoiceTeamId": 10,
          "predictionStatus": "CORRECT",
          "homeVoteRate": 100,
          "awayVoteRate": 0,
          "gameStatus": "COMPLETED",
          "updatedAt": "2025-07-07T17:46:53.496039"
        },
        {
          "gameId": 427,
          "gameTime": "19:30",
          "homeTeam": {
            "teamId": 3,
            "teamName": "키움 히어로즈",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/5/52/Kiwoom_Heroes.png"
          },
          "awayTeam": {
            "teamId": 5,
            "teamName": "KIA 타이거즈",
            "logoUrl": "https://upload.wikimedia.org/wikipedia/ko/6/6e/KIA_Tigers.png"
          },
          "homeScore": 2,
          "awayScore": 0,
          "userChoiceTeamId": 5,
          "predictionStatus": "INCORRECT",
          "homeVoteRate": 0,
          "awayVoteRate": 100,
          "gameStatus": "COMPLETED",
          "updatedAt": "2025-07-07T17:46:53.496039"
        }
      ]
    };
    return responseBody;
  }
}
