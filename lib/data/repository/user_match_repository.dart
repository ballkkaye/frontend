import 'package:ballkkaye_frontend/_core/utils/m_http.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class UserMatchRepository {
  Future<Map<String, dynamic>> getOne(int userMatchId) async {
    Response response = await dio.get("/s/api/matches/${userMatchId}");
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": {
    //     "isOwner": true,
    //     "relativeTime": "2분 전",
    //     "likeCount": 0,
    //     "isLike": false,
    //     "matchId": 1,
    //     "homeTeamName": "SSG 랜더스",
    //     "awayTeamName": "삼성 라이온즈",
    //     "gameDate": "2025-08-01",
    //     "stadiumName": "잠실야구장",
    //     "userNickname": "harim",
    //     "userTeamName": "SSG 랜더스",
    //     "userProfileUrl": "/img/profile.png",
    //     "title": "야구 직관 같이 가실 분~",
    //     "content": "삼성 vs LG 경기 직관 가실 분 구해요! 자리도 예매했어요.",
    //     "gender": "무관",
    //     "age": "연령 무관",
    //     "teamId": 5,
    //     "teamName": "KIA 타이거즈",
    //     "isSameTeam": false,
    //     "participationInfo": "1/4",
    //     "chatRoomId": 1
    //   }
    // };
    Logger().d(responseBody);
    return responseBody;
  }

  Future<Map<String, dynamic>> getList({
    int page = 0,
  }) async {
    Response response = await dio.get(
      "/s/api/matches",
      queryParameters: {
        'page': page,
      },
    );
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": {
    //     "selectedGender": null,
    //     "selectedAge": null,
    //     "selectedTeamId": null,
    //     "selectedTimeName": null,
    //     "matches": [
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "방금",
    //         "homeTeamName": "SSG 랜더스",
    //         "awayTeamName": "삼성 라이온즈",
    //         "title": "야구 직관 같이 가실 분~",
    //         "gender": "무관",
    //         "age": "연령 무관",
    //         "isSameTeam": false,
    //         "matchId": 7,
    //         "teamId": 6,
    //         "teamName": "삼성 라이온즈"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "방금",
    //         "homeTeamName": "SSG 랜더스",
    //         "awayTeamName": "삼성 라이온즈",
    //         "title": "야구 직관 같이 가실 분~",
    //         "gender": "무관",
    //         "age": "연령 무관",
    //         "isSameTeam": true,
    //         "matchId": 6,
    //         "teamId": 6,
    //         "teamName": "삼성 라이온즈"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "방금",
    //         "homeTeamName": "SSG 랜더스",
    //         "awayTeamName": "삼성 라이온즈",
    //         "title": "야구 직관 같이 가실 분~",
    //         "gender": "무관",
    //         "age": "연령 무관",
    //         "isSameTeam": false,
    //         "matchId": 5,
    //         "teamId": 5,
    //         "teamName": "KIA 타이거즈"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "방금",
    //         "homeTeamName": "SSG 랜더스",
    //         "awayTeamName": "삼성 라이온즈",
    //         "title": "야구 직관 같이 가실 분~",
    //         "gender": "무관",
    //         "age": "연령 무관",
    //         "isSameTeam": false,
    //         "matchId": 4,
    //         "teamId": 4,
    //         "teamName": "SSG 랜더스"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "방금",
    //         "homeTeamName": "SSG 랜더스",
    //         "awayTeamName": "삼성 라이온즈",
    //         "title": "야구 직관 같이 가실 분~",
    //         "gender": "무관",
    //         "age": "연령 무관",
    //         "isSameTeam": false,
    //         "matchId": 3,
    //         "teamId": 6,
    //         "teamName": "삼성 라이온즈"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "1시간 전",
    //         "homeTeamName": "SSG 랜더스",
    //         "awayTeamName": "키움 히어로즈",
    //         "title": "Consectetur sint",
    //         "gender": "남성",
    //         "age": "연령 무관",
    //         "isSameTeam": false,
    //         "matchId": 8,
    //         "teamId": 3,
    //         "teamName": "키움 히어로즈"
    //       },
    //       {
    //         "participationInfo": "2/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "키움 히어로즈",
    //         "awayTeamName": "삼성 라이온즈",
    //         "title": "Aperiam eaque occaecati",
    //         "gender": "남성",
    //         "age": "40대 이상",
    //         "isSameTeam": true,
    //         "matchId": 9,
    //         "teamId": 6,
    //         "teamName": "삼성 라이온즈"
    //       },
    //       {
    //         "participationInfo": "3/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "롯데 자이언츠",
    //         "awayTeamName": "NC 다이노스",
    //         "title": "Error dolorem rem quos",
    //         "gender": "무관",
    //         "age": "40대 이상",
    //         "isSameTeam": true,
    //         "matchId": 10,
    //         "teamId": 9,
    //         "teamName": "NC 다이노스"
    //       },
    //       {
    //         "participationInfo": "3/4",
    //         "relativeTime": "18시간 전",
    //         "homeTeamName": "SSG 랜더스",
    //         "awayTeamName": "두산 베어스",
    //         "title": "Voluptatibus natus non numquam",
    //         "gender": "남성",
    //         "age": "20~30대",
    //         "isSameTeam": false,
    //         "matchId": 11,
    //         "teamId": 4,
    //         "teamName": "SSG 랜더스"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "6시간 전",
    //         "homeTeamName": "두산 베어스",
    //         "awayTeamName": "NC 다이노스",
    //         "title": "Dolores alias",
    //         "gender": "남성",
    //         "age": "20~30대",
    //         "isSameTeam": false,
    //         "matchId": 12,
    //         "teamId": 2,
    //         "teamName": "두산 베어스"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "KT 위즈",
    //         "awayTeamName": "LG 트윈스",
    //         "title": "Numquam non ut voluptatem",
    //         "gender": "무관",
    //         "age": "30~40대",
    //         "isSameTeam": true,
    //         "matchId": 13,
    //         "teamId": 10,
    //         "teamName": "KT 위즈"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "7시간 전",
    //         "homeTeamName": "한화 이글스",
    //         "awayTeamName": "SSG 랜더스",
    //         "title": "Corporis quasi",
    //         "gender": "여성",
    //         "age": "30~40대",
    //         "isSameTeam": true,
    //         "matchId": 14,
    //         "teamId": 4,
    //         "teamName": "SSG 랜더스"
    //       },
    //       {
    //         "participationInfo": "2/4",
    //         "relativeTime": "10시간 전",
    //         "homeTeamName": "롯데 자이언츠",
    //         "awayTeamName": "KIA 타이거즈",
    //         "title": "Libero non",
    //         "gender": "무관",
    //         "age": "연령 무관",
    //         "isSameTeam": false,
    //         "matchId": 15,
    //         "teamId": 7,
    //         "teamName": "롯데 자이언츠"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "KIA 타이거즈",
    //         "awayTeamName": "NC 다이노스",
    //         "title": "Omnis deserunt reprehenderit unde harum",
    //         "gender": "무관",
    //         "age": "30~40대",
    //         "isSameTeam": false,
    //         "matchId": 16,
    //         "teamId": 9,
    //         "teamName": "NC 다이노스"
    //       },
    //       {
    //         "participationInfo": "2/4",
    //         "relativeTime": "22시간 전",
    //         "homeTeamName": "KT 위즈",
    //         "awayTeamName": "NC 다이노스",
    //         "title": "Beatae optio expedita natus saepe",
    //         "gender": "무관",
    //         "age": "40대 이상",
    //         "isSameTeam": true,
    //         "matchId": 17,
    //         "teamId": 10,
    //         "teamName": "KT 위즈"
    //       },
    //       {
    //         "participationInfo": "2/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "키움 히어로즈",
    //         "awayTeamName": "한화 이글스",
    //         "title": "Voluptatum adipisci veritatis",
    //         "gender": "무관",
    //         "age": "~20대",
    //         "isSameTeam": false,
    //         "matchId": 18,
    //         "teamId": 3,
    //         "teamName": "키움 히어로즈"
    //       },
    //       {
    //         "participationInfo": "3/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "KT 위즈",
    //         "awayTeamName": "두산 베어스",
    //         "title": "Corrupti doloribus",
    //         "gender": "여성",
    //         "age": "20~30대",
    //         "isSameTeam": false,
    //         "matchId": 19,
    //         "teamId": 10,
    //         "teamName": "KT 위즈"
    //       },
    //       {
    //         "participationInfo": "3/4",
    //         "relativeTime": "18시간 전",
    //         "homeTeamName": "삼성 라이온즈",
    //         "awayTeamName": "KIA 타이거즈",
    //         "title": "Consequatur assumenda fugiat suscipit corrupti",
    //         "gender": "무관",
    //         "age": "40대 이상",
    //         "isSameTeam": false,
    //         "matchId": 20,
    //         "teamId": 5,
    //         "teamName": "KIA 타이거즈"
    //       },
    //       {
    //         "participationInfo": "3/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "롯데 자이언츠",
    //         "awayTeamName": "KT 위즈",
    //         "title": "Ex ducimus veniam ex",
    //         "gender": "여성",
    //         "age": "30~40대",
    //         "isSameTeam": true,
    //         "matchId": 21,
    //         "teamId": 10,
    //         "teamName": "KT 위즈"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "한화 이글스",
    //         "awayTeamName": "LG 트윈스",
    //         "title": "Nam beatae maxime",
    //         "gender": "남성",
    //         "age": "20~30대",
    //         "isSameTeam": false,
    //         "matchId": 22,
    //         "teamId": 8,
    //         "teamName": "한화 이글스"
    //       },
    //       {
    //         "participationInfo": "2/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "KT 위즈",
    //         "awayTeamName": "롯데 자이언츠",
    //         "title": "Iste a reiciendis",
    //         "gender": "남성",
    //         "age": "연령 무관",
    //         "isSameTeam": false,
    //         "matchId": 23,
    //         "teamId": 10,
    //         "teamName": "KT 위즈"
    //       },
    //       {
    //         "participationInfo": "2/4",
    //         "relativeTime": "16시간 전",
    //         "homeTeamName": "삼성 라이온즈",
    //         "awayTeamName": "한화 이글스",
    //         "title": "Repellendus quo ipsa nam",
    //         "gender": "무관",
    //         "age": "20~30대",
    //         "isSameTeam": false,
    //         "matchId": 24,
    //         "teamId": 6,
    //         "teamName": "삼성 라이온즈"
    //       },
    //       {
    //         "participationInfo": "2/4",
    //         "relativeTime": "22시간 전",
    //         "homeTeamName": "KT 위즈",
    //         "awayTeamName": "NC 다이노스",
    //         "title": "Mollitia molestiae expedita maxime eos",
    //         "gender": "남성",
    //         "age": "연령 무관",
    //         "isSameTeam": false,
    //         "matchId": 25,
    //         "teamId": 10,
    //         "teamName": "KT 위즈"
    //       },
    //       {
    //         "participationInfo": "3/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "KT 위즈",
    //         "awayTeamName": "삼성 라이온즈",
    //         "title": "Numquam deleniti magni occaecati",
    //         "gender": "여성",
    //         "age": "20~30대",
    //         "isSameTeam": true,
    //         "matchId": 26,
    //         "teamId": 6,
    //         "teamName": "삼성 라이온즈"
    //       },
    //       {
    //         "participationInfo": "3/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "KT 위즈",
    //         "awayTeamName": "LG 트윈스",
    //         "title": "Eum impedit cumque nemo",
    //         "gender": "무관",
    //         "age": "연령 무관",
    //         "isSameTeam": true,
    //         "matchId": 27,
    //         "teamId": 10,
    //         "teamName": "KT 위즈"
    //       }
    //     ]
    //   }
    // };
    Logger().d(responseBody);
    return responseBody;
  }

  Future<Map<String, dynamic>> getListByQuery({
    int? page,
    String? gender,
    String? age,
    int? teamId,
  }) async {
    Response response = await dio.get("/s/api/matches", queryParameters: {
      if (page != null) 'page': page, // TODO : 페이징 처리시 default = 0으로 변경
      if (gender != null) 'gender': gender,
      if (age != null) 'age': age,
      if (teamId != null) 'teamId': teamId.toString(),
    });
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": {
    //     "selectedGender": null,
    //     "selectedAge": null,
    //     "selectedTeamId": null,
    //     "selectedTimeName": null,
    //     "matches": [
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "방금",
    //         "homeTeamName": "SSG 랜더스",
    //         "awayTeamName": "삼성 라이온즈",
    //         "title": "야구 직관 같이 가실 분~",
    //         "gender": "무관",
    //         "age": "연령 무관",
    //         "isSameTeam": false,
    //         "matchId": 7,
    //         "teamId": 6,
    //         "teamName": "삼성 라이온즈"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "방금",
    //         "homeTeamName": "SSG 랜더스",
    //         "awayTeamName": "삼성 라이온즈",
    //         "title": "야구 직관 같이 가실 분~",
    //         "gender": "무관",
    //         "age": "연령 무관",
    //         "isSameTeam": true,
    //         "matchId": 6,
    //         "teamId": 6,
    //         "teamName": "삼성 라이온즈"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "방금",
    //         "homeTeamName": "SSG 랜더스",
    //         "awayTeamName": "삼성 라이온즈",
    //         "title": "야구 직관 같이 가실 분~",
    //         "gender": "무관",
    //         "age": "연령 무관",
    //         "isSameTeam": false,
    //         "matchId": 5,
    //         "teamId": 5,
    //         "teamName": "KIA 타이거즈"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "방금",
    //         "homeTeamName": "SSG 랜더스",
    //         "awayTeamName": "삼성 라이온즈",
    //         "title": "야구 직관 같이 가실 분~",
    //         "gender": "무관",
    //         "age": "연령 무관",
    //         "isSameTeam": false,
    //         "matchId": 4,
    //         "teamId": 4,
    //         "teamName": "SSG 랜더스"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "방금",
    //         "homeTeamName": "SSG 랜더스",
    //         "awayTeamName": "삼성 라이온즈",
    //         "title": "야구 직관 같이 가실 분~",
    //         "gender": "무관",
    //         "age": "연령 무관",
    //         "isSameTeam": false,
    //         "matchId": 3,
    //         "teamId": 6,
    //         "teamName": "삼성 라이온즈"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "1시간 전",
    //         "homeTeamName": "SSG 랜더스",
    //         "awayTeamName": "키움 히어로즈",
    //         "title": "Consectetur sint",
    //         "gender": "남성",
    //         "age": "연령 무관",
    //         "isSameTeam": false,
    //         "matchId": 8,
    //         "teamId": 3,
    //         "teamName": "키움 히어로즈"
    //       },
    //       {
    //         "participationInfo": "2/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "키움 히어로즈",
    //         "awayTeamName": "삼성 라이온즈",
    //         "title": "Aperiam eaque occaecati",
    //         "gender": "남성",
    //         "age": "40대 이상",
    //         "isSameTeam": true,
    //         "matchId": 9,
    //         "teamId": 6,
    //         "teamName": "삼성 라이온즈"
    //       },
    //       {
    //         "participationInfo": "3/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "롯데 자이언츠",
    //         "awayTeamName": "NC 다이노스",
    //         "title": "Error dolorem rem quos",
    //         "gender": "무관",
    //         "age": "40대 이상",
    //         "isSameTeam": true,
    //         "matchId": 10,
    //         "teamId": 9,
    //         "teamName": "NC 다이노스"
    //       },
    //       {
    //         "participationInfo": "3/4",
    //         "relativeTime": "18시간 전",
    //         "homeTeamName": "SSG 랜더스",
    //         "awayTeamName": "두산 베어스",
    //         "title": "Voluptatibus natus non numquam",
    //         "gender": "남성",
    //         "age": "20~30대",
    //         "isSameTeam": false,
    //         "matchId": 11,
    //         "teamId": 4,
    //         "teamName": "SSG 랜더스"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "6시간 전",
    //         "homeTeamName": "두산 베어스",
    //         "awayTeamName": "NC 다이노스",
    //         "title": "Dolores alias",
    //         "gender": "남성",
    //         "age": "20~30대",
    //         "isSameTeam": false,
    //         "matchId": 12,
    //         "teamId": 2,
    //         "teamName": "두산 베어스"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "KT 위즈",
    //         "awayTeamName": "LG 트윈스",
    //         "title": "Numquam non ut voluptatem",
    //         "gender": "무관",
    //         "age": "30~40대",
    //         "isSameTeam": true,
    //         "matchId": 13,
    //         "teamId": 10,
    //         "teamName": "KT 위즈"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "7시간 전",
    //         "homeTeamName": "한화 이글스",
    //         "awayTeamName": "SSG 랜더스",
    //         "title": "Corporis quasi",
    //         "gender": "여성",
    //         "age": "30~40대",
    //         "isSameTeam": true,
    //         "matchId": 14,
    //         "teamId": 4,
    //         "teamName": "SSG 랜더스"
    //       },
    //       {
    //         "participationInfo": "2/4",
    //         "relativeTime": "10시간 전",
    //         "homeTeamName": "롯데 자이언츠",
    //         "awayTeamName": "KIA 타이거즈",
    //         "title": "Libero non",
    //         "gender": "무관",
    //         "age": "연령 무관",
    //         "isSameTeam": false,
    //         "matchId": 15,
    //         "teamId": 7,
    //         "teamName": "롯데 자이언츠"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "KIA 타이거즈",
    //         "awayTeamName": "NC 다이노스",
    //         "title": "Omnis deserunt reprehenderit unde harum",
    //         "gender": "무관",
    //         "age": "30~40대",
    //         "isSameTeam": false,
    //         "matchId": 16,
    //         "teamId": 9,
    //         "teamName": "NC 다이노스"
    //       },
    //       {
    //         "participationInfo": "2/4",
    //         "relativeTime": "22시간 전",
    //         "homeTeamName": "KT 위즈",
    //         "awayTeamName": "NC 다이노스",
    //         "title": "Beatae optio expedita natus saepe",
    //         "gender": "무관",
    //         "age": "40대 이상",
    //         "isSameTeam": true,
    //         "matchId": 17,
    //         "teamId": 10,
    //         "teamName": "KT 위즈"
    //       },
    //       {
    //         "participationInfo": "2/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "키움 히어로즈",
    //         "awayTeamName": "한화 이글스",
    //         "title": "Voluptatum adipisci veritatis",
    //         "gender": "무관",
    //         "age": "~20대",
    //         "isSameTeam": false,
    //         "matchId": 18,
    //         "teamId": 3,
    //         "teamName": "키움 히어로즈"
    //       },
    //       {
    //         "participationInfo": "3/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "KT 위즈",
    //         "awayTeamName": "두산 베어스",
    //         "title": "Corrupti doloribus",
    //         "gender": "여성",
    //         "age": "20~30대",
    //         "isSameTeam": false,
    //         "matchId": 19,
    //         "teamId": 10,
    //         "teamName": "KT 위즈"
    //       },
    //       {
    //         "participationInfo": "3/4",
    //         "relativeTime": "18시간 전",
    //         "homeTeamName": "삼성 라이온즈",
    //         "awayTeamName": "KIA 타이거즈",
    //         "title": "Consequatur assumenda fugiat suscipit corrupti",
    //         "gender": "무관",
    //         "age": "40대 이상",
    //         "isSameTeam": false,
    //         "matchId": 20,
    //         "teamId": 5,
    //         "teamName": "KIA 타이거즈"
    //       },
    //       {
    //         "participationInfo": "3/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "롯데 자이언츠",
    //         "awayTeamName": "KT 위즈",
    //         "title": "Ex ducimus veniam ex",
    //         "gender": "여성",
    //         "age": "30~40대",
    //         "isSameTeam": true,
    //         "matchId": 21,
    //         "teamId": 10,
    //         "teamName": "KT 위즈"
    //       },
    //       {
    //         "participationInfo": "1/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "한화 이글스",
    //         "awayTeamName": "LG 트윈스",
    //         "title": "Nam beatae maxime",
    //         "gender": "남성",
    //         "age": "20~30대",
    //         "isSameTeam": false,
    //         "matchId": 22,
    //         "teamId": 8,
    //         "teamName": "한화 이글스"
    //       },
    //       {
    //         "participationInfo": "2/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "KT 위즈",
    //         "awayTeamName": "롯데 자이언츠",
    //         "title": "Iste a reiciendis",
    //         "gender": "남성",
    //         "age": "연령 무관",
    //         "isSameTeam": false,
    //         "matchId": 23,
    //         "teamId": 10,
    //         "teamName": "KT 위즈"
    //       },
    //       {
    //         "participationInfo": "2/4",
    //         "relativeTime": "16시간 전",
    //         "homeTeamName": "삼성 라이온즈",
    //         "awayTeamName": "한화 이글스",
    //         "title": "Repellendus quo ipsa nam",
    //         "gender": "무관",
    //         "age": "20~30대",
    //         "isSameTeam": false,
    //         "matchId": 24,
    //         "teamId": 6,
    //         "teamName": "삼성 라이온즈"
    //       },
    //       {
    //         "participationInfo": "2/4",
    //         "relativeTime": "22시간 전",
    //         "homeTeamName": "KT 위즈",
    //         "awayTeamName": "NC 다이노스",
    //         "title": "Mollitia molestiae expedita maxime eos",
    //         "gender": "남성",
    //         "age": "연령 무관",
    //         "isSameTeam": false,
    //         "matchId": 25,
    //         "teamId": 10,
    //         "teamName": "KT 위즈"
    //       },
    //       {
    //         "participationInfo": "3/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "KT 위즈",
    //         "awayTeamName": "삼성 라이온즈",
    //         "title": "Numquam deleniti magni occaecati",
    //         "gender": "여성",
    //         "age": "20~30대",
    //         "isSameTeam": true,
    //         "matchId": 26,
    //         "teamId": 6,
    //         "teamName": "삼성 라이온즈"
    //       },
    //       {
    //         "participationInfo": "3/4",
    //         "relativeTime": "1일 전",
    //         "homeTeamName": "KT 위즈",
    //         "awayTeamName": "LG 트윈스",
    //         "title": "Eum impedit cumque nemo",
    //         "gender": "무관",
    //         "age": "연령 무관",
    //         "isSameTeam": true,
    //         "matchId": 27,
    //         "teamId": 10,
    //         "teamName": "KT 위즈"
    //       }
    //     ]
    //   }
    // };
    Logger().d(responseBody);
    return responseBody;
  }

  // queryParameters 테스트용
  // Future<Map<String, dynamic>> getListByQuery({
  //   int? page,
  //   String? gender,
  //   String? age,
  //   int? teamId,
  // }) async {
  //   final allMatches = [
  //     {
  //       "participationInfo": "1/4",
  //       "relativeTime": "방금",
  //       "homeTeamName": "SSG 랜더스",
  //       "awayTeamName": "삼성 라이온즈",
  //       "title": "야구 직관 같이 가실 분~",
  //       "gender": "무관",
  //       "age": "연령 무관",
  //       "isSameTeam": false,
  //       "matchId": 7,
  //       "teamId": 6,
  //       "teamName": "삼성 라이온즈"
  //     },
  //     {
  //       "participationInfo": "1/4",
  //       "relativeTime": "방금",
  //       "homeTeamName": "SSG 랜더스",
  //       "awayTeamName": "삼성 라이온즈",
  //       "title": "야구 직관 같이 가실 분~",
  //       "gender": "무관",
  //       "age": "연령 무관",
  //       "isSameTeam": false,
  //       "matchId": 6,
  //       "teamId": 6,
  //       "teamName": "삼성 라이온즈"
  //     },
  //     {
  //       "participationInfo": "1/4",
  //       "relativeTime": "방금",
  //       "homeTeamName": "SSG 랜더스",
  //       "awayTeamName": "삼성 라이온즈",
  //       "title": "야구 직관 같이 가실 분~",
  //       "gender": "무관",
  //       "age": "연령 무관",
  //       "isSameTeam": false,
  //       "matchId": 5,
  //       "teamId": 5,
  //       "teamName": "KIA 타이거즈"
  //     },
  //     {
  //       "participationInfo": "1/4",
  //       "relativeTime": "방금",
  //       "homeTeamName": "SSG 랜더스",
  //       "awayTeamName": "삼성 라이온즈",
  //       "title": "야구 직관 같이 가실 분~",
  //       "gender": "무관",
  //       "age": "연령 무관",
  //       "isSameTeam": false,
  //       "matchId": 4,
  //       "teamId": 4,
  //       "teamName": "SSG 랜더스"
  //     },
  //     {
  //       "participationInfo": "1/4",
  //       "relativeTime": "방금",
  //       "homeTeamName": "SSG 랜더스",
  //       "awayTeamName": "삼성 라이온즈",
  //       "title": "야구 직관 같이 가실 분~",
  //       "gender": "무관",
  //       "age": "연령 무관",
  //       "isSameTeam": false,
  //       "matchId": 3,
  //       "teamId": 6,
  //       "teamName": "삼성 라이온즈"
  //     },
  //     {
  //       "participationInfo": "1/4",
  //       "relativeTime": "1시간 전",
  //       "homeTeamName": "SSG 랜더스",
  //       "awayTeamName": "키움 히어로즈",
  //       "title": "Consectetur sint",
  //       "gender": "남성",
  //       "age": "연령 무관",
  //       "isSameTeam": false,
  //       "matchId": 8,
  //       "teamId": 3,
  //       "teamName": "키움 히어로즈"
  //     },
  //     {
  //       "participationInfo": "2/4",
  //       "relativeTime": "1일 전",
  //       "homeTeamName": "키움 히어로즈",
  //       "awayTeamName": "삼성 라이온즈",
  //       "title": "Aperiam eaque occaecati",
  //       "gender": "남성",
  //       "age": "40대 이상",
  //       "isSameTeam": true,
  //       "matchId": 9,
  //       "teamId": 6,
  //       "teamName": "삼성 라이온즈"
  //     },
  //     {
  //       "participationInfo": "3/4",
  //       "relativeTime": "1일 전",
  //       "homeTeamName": "롯데 자이언츠",
  //       "awayTeamName": "NC 다이노스",
  //       "title": "Error dolorem rem quos",
  //       "gender": "무관",
  //       "age": "40대 이상",
  //       "isSameTeam": true,
  //       "matchId": 10,
  //       "teamId": 9,
  //       "teamName": "NC 다이노스"
  //     },
  //     {
  //       "participationInfo": "3/4",
  //       "relativeTime": "18시간 전",
  //       "homeTeamName": "SSG 랜더스",
  //       "awayTeamName": "두산 베어스",
  //       "title": "Voluptatibus natus non numquam",
  //       "gender": "남성",
  //       "age": "20~30대",
  //       "isSameTeam": false,
  //       "matchId": 11,
  //       "teamId": 4,
  //       "teamName": "SSG 랜더스"
  //     },
  //     {
  //       "participationInfo": "1/4",
  //       "relativeTime": "6시간 전",
  //       "homeTeamName": "두산 베어스",
  //       "awayTeamName": "NC 다이노스",
  //       "title": "Dolores alias",
  //       "gender": "남성",
  //       "age": "20~30대",
  //       "isSameTeam": false,
  //       "matchId": 12,
  //       "teamId": 2,
  //       "teamName": "두산 베어스"
  //     },
  //     {
  //       "participationInfo": "1/4",
  //       "relativeTime": "1일 전",
  //       "homeTeamName": "KT 위즈",
  //       "awayTeamName": "LG 트윈스",
  //       "title": "Numquam non ut voluptatem",
  //       "gender": "무관",
  //       "age": "30~40대",
  //       "isSameTeam": true,
  //       "matchId": 13,
  //       "teamId": 10,
  //       "teamName": "KT 위즈"
  //     },
  //     {
  //       "participationInfo": "1/4",
  //       "relativeTime": "7시간 전",
  //       "homeTeamName": "한화 이글스",
  //       "awayTeamName": "SSG 랜더스",
  //       "title": "Corporis quasi",
  //       "gender": "여성",
  //       "age": "30~40대",
  //       "isSameTeam": true,
  //       "matchId": 14,
  //       "teamId": 4,
  //       "teamName": "SSG 랜더스"
  //     },
  //     {
  //       "participationInfo": "2/4",
  //       "relativeTime": "10시간 전",
  //       "homeTeamName": "롯데 자이언츠",
  //       "awayTeamName": "KIA 타이거즈",
  //       "title": "Libero non",
  //       "gender": "무관",
  //       "age": "연령 무관",
  //       "isSameTeam": false,
  //       "matchId": 15,
  //       "teamId": 7,
  //       "teamName": "롯데 자이언츠"
  //     },
  //     {
  //       "participationInfo": "1/4",
  //       "relativeTime": "1일 전",
  //       "homeTeamName": "KIA 타이거즈",
  //       "awayTeamName": "NC 다이노스",
  //       "title": "Omnis deserunt reprehenderit unde harum",
  //       "gender": "무관",
  //       "age": "30~40대",
  //       "isSameTeam": false,
  //       "matchId": 16,
  //       "teamId": 9,
  //       "teamName": "NC 다이노스"
  //     },
  //     {
  //       "participationInfo": "2/4",
  //       "relativeTime": "22시간 전",
  //       "homeTeamName": "KT 위즈",
  //       "awayTeamName": "NC 다이노스",
  //       "title": "Beatae optio expedita natus saepe",
  //       "gender": "무관",
  //       "age": "40대 이상",
  //       "isSameTeam": true,
  //       "matchId": 17,
  //       "teamId": 10,
  //       "teamName": "KT 위즈"
  //     },
  //     {
  //       "participationInfo": "2/4",
  //       "relativeTime": "1일 전",
  //       "homeTeamName": "키움 히어로즈",
  //       "awayTeamName": "한화 이글스",
  //       "title": "Voluptatum adipisci veritatis",
  //       "gender": "무관",
  //       "age": "~20대",
  //       "isSameTeam": false,
  //       "matchId": 18,
  //       "teamId": 3,
  //       "teamName": "키움 히어로즈"
  //     },
  //     {
  //       "participationInfo": "3/4",
  //       "relativeTime": "1일 전",
  //       "homeTeamName": "KT 위즈",
  //       "awayTeamName": "두산 베어스",
  //       "title": "Corrupti doloribus",
  //       "gender": "여성",
  //       "age": "20~30대",
  //       "isSameTeam": false,
  //       "matchId": 19,
  //       "teamId": 10,
  //       "teamName": "KT 위즈"
  //     },
  //     {
  //       "participationInfo": "3/4",
  //       "relativeTime": "18시간 전",
  //       "homeTeamName": "삼성 라이온즈",
  //       "awayTeamName": "KIA 타이거즈",
  //       "title": "Consequatur assumenda fugiat suscipit corrupti",
  //       "gender": "무관",
  //       "age": "40대 이상",
  //       "isSameTeam": false,
  //       "matchId": 20,
  //       "teamId": 5,
  //       "teamName": "KIA 타이거즈"
  //     },
  //     {
  //       "participationInfo": "3/4",
  //       "relativeTime": "1일 전",
  //       "homeTeamName": "롯데 자이언츠",
  //       "awayTeamName": "KT 위즈",
  //       "title": "Ex ducimus veniam ex",
  //       "gender": "여성",
  //       "age": "30~40대",
  //       "isSameTeam": true,
  //       "matchId": 21,
  //       "teamId": 10,
  //       "teamName": "KT 위즈"
  //     },
  //     {
  //       "participationInfo": "1/4",
  //       "relativeTime": "1일 전",
  //       "homeTeamName": "한화 이글스",
  //       "awayTeamName": "LG 트윈스",
  //       "title": "Nam beatae maxime",
  //       "gender": "남성",
  //       "age": "20~30대",
  //       "isSameTeam": false,
  //       "matchId": 22,
  //       "teamId": 8,
  //       "teamName": "한화 이글스"
  //     },
  //     {
  //       "participationInfo": "2/4",
  //       "relativeTime": "1일 전",
  //       "homeTeamName": "KT 위즈",
  //       "awayTeamName": "롯데 자이언츠",
  //       "title": "Iste a reiciendis",
  //       "gender": "남성",
  //       "age": "연령 무관",
  //       "isSameTeam": false,
  //       "matchId": 23,
  //       "teamId": 10,
  //       "teamName": "KT 위즈"
  //     },
  //     {
  //       "participationInfo": "2/4",
  //       "relativeTime": "16시간 전",
  //       "homeTeamName": "삼성 라이온즈",
  //       "awayTeamName": "한화 이글스",
  //       "title": "Repellendus quo ipsa nam",
  //       "gender": "무관",
  //       "age": "20~30대",
  //       "isSameTeam": false,
  //       "matchId": 24,
  //       "teamId": 6,
  //       "teamName": "삼성 라이온즈"
  //     },
  //     {
  //       "participationInfo": "2/4",
  //       "relativeTime": "22시간 전",
  //       "homeTeamName": "KT 위즈",
  //       "awayTeamName": "NC 다이노스",
  //       "title": "Mollitia molestiae expedita maxime eos",
  //       "gender": "남성",
  //       "age": "연령 무관",
  //       "isSameTeam": false,
  //       "matchId": 25,
  //       "teamId": 10,
  //       "teamName": "KT 위즈"
  //     },
  //     {
  //       "participationInfo": "3/4",
  //       "relativeTime": "1일 전",
  //       "homeTeamName": "KT 위즈",
  //       "awayTeamName": "삼성 라이온즈",
  //       "title": "Numquam deleniti magni occaecati",
  //       "gender": "여성",
  //       "age": "20~30대",
  //       "isSameTeam": true,
  //       "matchId": 26,
  //       "teamId": 6,
  //       "teamName": "삼성 라이온즈"
  //     },
  //     {
  //       "participationInfo": "3/4",
  //       "relativeTime": "1일 전",
  //       "homeTeamName": "KT 위즈",
  //       "awayTeamName": "LG 트윈스",
  //       "title": "Eum impedit cumque nemo",
  //       "gender": "무관",
  //       "age": "연령 무관",
  //       "isSameTeam": true,
  //       "matchId": 27,
  //       "teamId": 10,
  //       "teamName": "KT 위즈"
  //     }
  //   ];
  //
  //   final filteredMatches = allMatches.where((match) {
  //     final matchGender = match['gender'];
  //     final matchAge = match['age'];
  //     final matchTeamId = match['teamId'];
  //
  //     final genderMatch = gender == null || matchGender == gender;
  //     final ageMatch = age == null || matchAge == age;
  //     final teamMatch = teamId == null || matchTeamId == teamId;
  //
  //     return genderMatch && ageMatch && teamMatch;
  //   }).toList();
  //
  //   final responseBody = {
  //     "status": 200,
  //     "msg": "성공",
  //     "body": {
  //       "selectedGender": gender,
  //       "selectedAge": age,
  //       "selectedTeamId": teamId,
  //       "matches": filteredMatches,
  //     },
  //   };
  //
  //   Logger().d(responseBody);
  //   return responseBody;
  // }

  Future<Map<String, dynamic>> write(Map<String, dynamic> data) async {
    Response response = await dio.post("/s/api/matches", data: data);
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": {
    //     "chatRoom": {
    //       "id": 1,
    //       "gameId": 423,
    //       "homeTeamName": "두산 베어스",
    //       "awayTeamName": "SSG 랜더스",
    //       "matchTitle": "두산 베어스 vs SSG 랜더스",
    //       "preferredTeamId": 3,
    //       "preferredTeamName": "키움 히어로즈",
    //       "maxParticipants": 6,
    //       "preferredGender": "여성",
    //       "preferredAge": "20~30대",
    //       "isSameTeam": true,
    //       "createdAt": "2025-07-04 12:10"
    //     },
    //     "match": {
    //       "id": 4,
    //       "userNickname": "ssar",
    //       "userTeamName": "LG 트윈스",
    //       "chatRoomId": 4,
    //       "title": "같이 직관 가실 분 구해요!",
    //       "content": "잠실 경기 보러 갈 분 구합니다. 같은 팀 팬이면 더 좋아요!",
    //       "createdAt": "2025-07-04 12:10"
    //     }
    //   }
    // };
    Logger().d(responseBody);
    return responseBody;
  }

  Future<Map<String, dynamic>> deleteOne(int userMatchId) async {
    Response response = await dio.delete("/s/api/matches/${userMatchId}");
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": {"deleteStatus": "DELETED"}
    // };
    Logger().d(responseBody);
    return responseBody;
  }
}
