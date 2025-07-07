// class BoardRepository {
//   Future<Map<String, dynamic>> getBoardList(String accessToken) async {
//     try {
//       final response = await dio.get(
//         "/s/api/boards",
//         options: Options(headers: {
//           "Authorization": "Bearer $accessToken",
//         }),
//       );
//       print("API statusCode: ${response.statusCode}");
//       print("API data: ${response.data}");
//
//       if (response.statusCode == 200) {
//         final body = response.data['body'];
//         List<Team> teams = (body['teams'] as List).map((e) => Team.fromJson(e)).toList();
//         List<BoardItem> items = (body['items'] as List).map((e) => BoardItem.fromJson(e)).toList();
//
//         for (var item in items) {
//           final matched = teams.firstWhere((team) => team.teamId == item.team.teamId);
//           item.team = matched;
//         }
//
//         return {'teams': teams, 'items': items};
//       } else {
//         throw Exception("게시판 목록 불러오기 실패: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("BoardRepository Error: $e");
//       rethrow;
//     }
//   }
// }

import 'package:logger/logger.dart';

class BoardRepository {
  Future<Map<String, dynamic>> getList() async {
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {
        "teams": [
          {
            "teamId": 1,
            "teamName": "LG 트윈스",
            "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/4/4f/LG_Twins.png",
            "teamRank": 1
          },
          {
            "teamId": 2,
            "teamName": "두산 베어스",
            "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/0/09/Doosan_Bears.png",
            "teamRank": 2
          },
          {
            "teamId": 3,
            "teamName": "키움 히어로즈",
            "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/5/52/Kiwoom_Heroes.png",
            "teamRank": 3
          },
          {
            "teamId": 4,
            "teamName": "SSG 랜더스",
            "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/0/02/SSG_Landers.png",
            "teamRank": 4
          },
          {
            "teamId": 5,
            "teamName": "KIA 타이거즈",
            "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/6/6e/KIA_Tigers.png",
            "teamRank": 5
          },
          {
            "teamId": 6,
            "teamName": "삼성 라이온즈",
            "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/9/95/Samsung_Lions.png",
            "teamRank": 6
          },
          {
            "teamId": 7,
            "teamName": "롯데 자이언츠",
            "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/9/91/Lotte_Giants.png",
            "teamRank": 7
          },
          {
            "teamId": 8,
            "teamName": "한화 이글스",
            "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/9/99/Hanwha_Eagles.png",
            "teamRank": 8
          },
          {
            "teamId": 9,
            "teamName": "NC 다이노스",
            "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/b/bd/NC_Dinos.png",
            "teamRank": 9
          },
          {
            "teamId": 10,
            "teamName": "KT 위즈",
            "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/b/b3/KT_Wiz.png",
            "teamRank": 10
          }
        ],
        "items": [
          {
            "boardId": 13,
            "title": "오늘 경기 어땠나요?",
            "nickname": "ssar",
            "relativeTime": "방금",
            "teamId": 2,
            "teamName": "두산 베어스",
            "likeCount": 0,
            "replyCount": 0
          },
          {
            "boardId": 10,
            "title": "직관 다녀온 후기",
            "nickname": "ssar",
            "relativeTime": "4일 전",
            "teamId": 3,
            "teamName": "키움 히어로즈",
            "likeCount": 0,
            "replyCount": 0
          },
          {
            "boardId": 9,
            "title": "직관 다녀온 후기",
            "nickname": "ssar",
            "relativeTime": "4일 전",
            "teamId": 3,
            "teamName": "키움 히어로즈",
            "likeCount": 0,
            "replyCount": 0
          },
          {
            "boardId": 6,
            "title": "직관 다녀온 후기",
            "nickname": "ssar",
            "relativeTime": "4일 전",
            "teamId": 3,
            "teamName": "키움 히어로즈",
            "likeCount": 0,
            "replyCount": 0
          },
          {
            "boardId": 7,
            "title": "직관 다녀온 후기",
            "nickname": "ssar",
            "relativeTime": "4일 전",
            "teamId": 3,
            "teamName": "키움 히어로즈",
            "likeCount": 0,
            "replyCount": 0
          }
        ]
      }
    };
    Logger().d(responseBody);
    return responseBody;
  }
}
