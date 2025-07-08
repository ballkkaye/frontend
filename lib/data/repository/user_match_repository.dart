import 'package:logger/logger.dart';

class UserMatchRepository {
  Future<Map<String, dynamic>> getOne(int userMatchId) async {
    // Response response = await dio.get("/s/api/matches/${userMatchId}");
    // final responseBody = response.data; // = Map<String, dynamic> responseBody = response.data;
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {
        "isOwner": true,
        "relativeTime": "방금",
        "likeCount": 0,
        "isLike": false,
        "homeTeamName": "두산 베어스",
        "awayTeamName": "SSG 랜더스",
        "gameDate": "2025-07-05",
        "stadiumName": "잠실야구장",
        "userNickname": "ssar",
        "userTeamName": "LG 트윈스",
        "userProfileUrl": "/img/profile.png",
        "title": "같이 직관 가실 분 구해요!",
        "content": "잠실 경기 보러 갈 분 구합니다. 같은 팀 팬이면 더 좋아요!",
        "gender": "여성",
        "age": "20~30대",
        "isSameTeam": true,
        "participationInfo": "1/6",
        "chatRoomId": 1
      }
    };
    Logger().d(responseBody);
    return responseBody;
  }

  Future<Map<String, dynamic>> getList() async {
    // Response response = await dio.get("/s/api/matches");
    // final responseBody = response.data; // = Map<String, dynamic> responseBody = response.data;
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {
        "selectedGender": null,
        "selectedAge": null,
        "selectedTeamId": null,
        "selectedTimeName": null,
        "matches": [
          {
            "participationInfo": "1/6",
            "relativeTime": "방금",
            "gameTitle": "두산 베어스 vs SSG 랜더스",
            "title": "같이 직관 가실 분 구해요!",
            "gender": "여성",
            "age": "20~30대",
            "isSameTeam": true,
            "matchId": 4
          },
          {
            "participationInfo": "1/6",
            "relativeTime": "방금",
            "gameTitle": "두산 베어스 vs SSG 랜더스",
            "title": "같이 직관 가실 분 구해요!",
            "gender": "여성",
            "age": "20~30대",
            "isSameTeam": true,
            "matchId": 3
          },
          {
            "participationInfo": "1/6",
            "relativeTime": "방금",
            "gameTitle": "두산 베어스 vs SSG 랜더스",
            "title": "같이 직관 가실 분 구해요!",
            "gender": "여성",
            "age": "20~30대",
            "isSameTeam": true,
            "matchId": 2
          },
          {
            "participationInfo": "1/6",
            "relativeTime": "방금",
            "gameTitle": "두산 베어스 vs SSG 랜더스",
            "title": "같이 직관 가실 분 구해요!",
            "gender": "여성",
            "age": "20~30대",
            "isSameTeam": true,
            "matchId": 1
          }
        ]
      }
    };
    Logger().d(responseBody);
    return responseBody;
  }
}
