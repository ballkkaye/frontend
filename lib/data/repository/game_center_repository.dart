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

  // 상대 전적 확인
  Future<Map<String, dynamic>> getMatchup({required int gameId, required int teamId}) async {
    // Response response = await dio.get("/api/today/hitter-lineup",
    //     queryParameters: {"gameId": gameId, "teamId": teamId},);
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {
        "gameId": 423,
        "season": 2025,
        "hitters": [
          {"hitPredictionPer": 29.1, "teamId": 2, "hitterOrder": 1, "name": "홍성우", "position": "1루수", "ab": 3, "h": 1, "avg": 0.333, "ops": 0.821},
          {"hitPredictionPer": 34.3, "teamId": 2, "hitterOrder": 2, "name": "박정호", "position": "2루수", "ab": 4, "h": 2, "avg": 0.5, "ops": 0.92},
          {"hitPredictionPer": 31.6, "teamId": 2, "hitterOrder": 3, "name": "이재원", "position": "3루수", "ab": 2, "h": 1, "avg": 0.5, "ops": 0.85},
          {"hitPredictionPer": 21.3, "teamId": 2, "hitterOrder": 4, "name": "정우영", "position": "유격수", "ab": 3, "h": 0, "avg": 0.0, "ops": 0.65},
          {"hitPredictionPer": 36.5, "teamId": 2, "hitterOrder": 5, "name": "최재훈", "position": "좌익수", "ab": 3, "h": 2, "avg": 0.667, "ops": 0.94},
          {"hitPredictionPer": 27.3, "teamId": 2, "hitterOrder": 6, "name": "김재현", "position": "중견수", "ab": 4, "h": 1, "avg": 0.25, "ops": 0.77},
          {"hitPredictionPer": 31.7, "teamId": 2, "hitterOrder": 7, "name": "류지혁", "position": "우익수", "ab": 2, "h": 1, "avg": 0.5, "ops": 0.865},
          {"hitPredictionPer": 27.0, "teamId": 2, "hitterOrder": 8, "name": "한지민", "position": "포수", "ab": 3, "h": 1, "avg": 0.333, "ops": 0.745},
          {"hitPredictionPer": 20.9, "teamId": 2, "hitterOrder": 9, "name": "노성현", "position": "지명타자", "ab": 3, "h": 0, "avg": 0.0, "ops": 0.68}
        ],
        "profileUrl": "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/51867.png",
        "name": "김건우",
        "gameCount": 27,
        "result": "2승 3패",
        "era": 4.58,
        "whip": 1.53,
        "qs": 0
      }
    };
    return responseBody;
  }
}
