import 'package:ballkkaye_frontend/_core/utils/m_http.dart';
import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class BoardRepository {
  Future<Map<String, dynamic>> getOne(int boardId) async {
    Response response = await dio.get("/s/api/boards/${boardId}");
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": {
    //     "boardId": 1,
    //     "nickname": "cos",
    //     // "profileImageUrl": "/img/profile.png",
    //     "relativeTime": "8분 전",
    //     "myTeamName": "두산 베어스",
    //     "teamCategoryId": 3,
    //     "teamCategoryName": "키움 히어로즈",
    //     "title": "수정된 게시글 제목",
    //     "content": "이건 수정된 게시글 내용입니다.",
    //     "isOwner": true,
    //     "isLike": false,
    //     "likeCount": 0,
    //     // "images": [
    //     //   {"id": 1, "imageUrl": "https://s3.ap-northeast-2.amazonaws.com/bucket-name/images/img001.png"},
    //     //   {"id": 2, "imageUrl": "https://s3.ap-northeast-2.amazonaws.com/bucket-name/images/img002.png"},
    //     //   {"id": 3, "imageUrl": "https://s3.ap-northeast-2.amazonaws.com/bucket-name/images/new003.png"}
    //     // ],
    //     "replyItems": [
    //       {
    //         "replyId": 1,
    //         "nickname": "cos",
    //         "profileImg": "/img/profile.png",
    //         "relativeTime": "8분 전",
    //         "myTeamName": "두산 베어스",
    //         "content": "좋은 글이네요! 감사합니다.",
    //         "isOwner": true,
    //         "isLike": false,
    //         "likeCount": 0,
    //         "childReplies": [
    //           {
    //             "replyId": 2,
    //             "nickname": "harim",
    //             "profileImg": "/img/profile.png",
    //             "relativeTime": "1분 전",
    //             "myTeamName": "SSG 랜더스",
    //             "content": "좋은 글이네요! 감사합니다.",
    //             "parentReplyId": 1,
    //             "tagReplyId": null,
    //             "tagReplyName": null,
    //             "isOwner": false,
    //             "isLike": false,
    //             "likeCount": 0,
    //           },
    //           {
    //             "replyId": 3,
    //             "nickname": "jungwon",
    //             "profileImg": "/img/profile.png",
    //             "relativeTime": "방금",
    //             "myTeamName": "KIA 타이거즈",
    //             "content": "좋은 글이네요! 감사합니다.",
    //             "parentReplyId": 1,
    //             "tagReplyId": 2,
    //             "tagReplyName": "harim",
    //             "isOwner": false,
    //             "isLike": false,
    //             "likeCount": 0,
    //           }
    //         ]
    //       },
    //       {
    //         "replyId": 4,
    //         "nickname": "jungwon",
    //         "profileImg": "/img/profile.png",
    //         "relativeTime": "4분 전",
    //         "myTeamName": "KIA 타이거즈",
    //         "content": "좋은 글이네요! 감사합니다.",
    //         "isOwner": true,
    //         "isLike": false,
    //         "likeCount": 0,
    //       }
    //     ]
    //   }
    // };
    Logger().d('BoardRepository getOne:  $responseBody');
    return responseBody;
  }

  Future<Map<String, dynamic>> getList() async {
    Response response = await dio.get("/s/api/boards");
    // final responseBody = response.data;
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {
        "teams": [
          {
            "teamId": 1,
            "teamName": "LG 트윈스",
            "teamLogo":
                "https://cdn.pixabay.com/photo/2023/02/04/14/18/underwater-7767303_640.jpg",
            "teamRank": 1
          },
          {
            "teamId": 2,
            "teamName": "두산 베어스",
            "teamLogo":
                "https://upload.wikimedia.org/wikipedia/ko/0/09/Doosan_Bears.png",
            "teamRank": 2
          },
          {
            "teamId": 3,
            "teamName": "키움 히어로즈",
            "teamLogo":
                "https://upload.wikimedia.org/wikipedia/ko/5/52/Kiwoom_Heroes.png",
            "teamRank": 3
          },
          {
            "teamId": 4,
            "teamName": "SSG 랜더스",
            "teamLogo":
                "https://upload.wikimedia.org/wikipedia/ko/0/02/SSG_Landers.png",
            "teamRank": 4
          },
          {
            "teamId": 5,
            "teamName": "KIA 타이거즈",
            "teamLogo":
                "https://upload.wikimedia.org/wikipedia/ko/6/6e/KIA_Tigers.png",
            "teamRank": 5
          },
          {
            "teamId": 6,
            "teamName": "삼성 라이온즈",
            "teamLogo":
                "https://upload.wikimedia.org/wikipedia/ko/9/95/Samsung_Lions.png",
            "teamRank": 6
          },
          {
            "teamId": 7,
            "teamName": "롯데 자이언츠",
            "teamLogo":
                "https://upload.wikimedia.org/wikipedia/ko/9/91/Lotte_Giants.png",
            "teamRank": 7
          },
          {
            "teamId": 8,
            "teamName": "한화 이글스",
            "teamLogo":
                "https://upload.wikimedia.org/wikipedia/ko/9/99/Hanwha_Eagles.png",
            "teamRank": 8
          },
          {
            "teamId": 9,
            "teamName": "NC 다이노스",
            "teamLogo":
                "https://upload.wikimedia.org/wikipedia/ko/b/bd/NC_Dinos.png",
            "teamRank": 9
          },
          {
            "teamId": 10,
            "teamName": "KT 위즈",
            "teamLogo":
                "https://upload.wikimedia.org/wikipedia/ko/b/b3/KT_Wiz.png",
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
            "likeCount": 1,
            "replyCount": 1
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
    Logger().d('BoardRepository getList:  $responseBody');
    return responseBody;
  }

  Future<Map<String, dynamic>> write(
      int teamId, String title, String content) async {
    Response response = await dio.post("/s/api/boards", data: {
      "teamId": teamId,
      "title": title,
      "content": content
    }); // TODO : 이미지 추가
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": {
    //     "imagesUrl": [
    //       {
    //         "id": 1,
    //         "imageUrl":
    //             "https://s3.ap-northeast-2.amazonaws.com/bucket-name/images/img001.png"
    //       },
    //       {
    //         "id": 2,
    //         "imageUrl":
    //             "https://s3.ap-northeast-2.amazonaws.com/bucket-name/images/img002.png"
    //       }
    //     ],
    //     "boardId": 12,
    //     "title": "새로운 게시글 제목",
    //     "teamId": 2,
    //     "content": "이것은 게시글 본문입니다.",
    //     "relativeTime": "방금",
    //     "nickname": "cos",
    //     "likeCount": 0,
    //     "replyCount": 0,
    //   }
    // };
    Logger().d('BoardRepository write:  $responseBody');
    return responseBody;
  }

  Future<Map<String, dynamic>> updateOne(Board board) async {
    Response response = await dio.put("/s/api/boards/${board.boardId}", data: {
      "title": board.title,
      "content": board.content,
    }); // TODO : 이미지 추가
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": {
    //     "imagesUrl": [
    //       {
    //         "id": 1,
    //         "imageUrl":
    //             "https://s3.ap-northeast-2.amazonaws.com/bucket-name/images/img001.png"
    //       },
    //       {
    //         "id": 2,
    //         "imageUrl":
    //             "https://s3.ap-northeast-2.amazonaws.com/bucket-name/images/img002.png"
    //       },
    //       {
    //         "id": 3,
    //         "imageUrl":
    //             "https://s3.ap-northeast-2.amazonaws.com/bucket-name/images/new003.png"
    //       }
    //     ],
    //     "boardId": 12,
    //     "title": "수정된 게시글 제목2",
    //     "teamId": 3,
    //     "content": "이건 수정된 게시글 내용입니다2.",
    //     "nickname": "love",
    //     "relativeTime": "1분전",
    //     "likeCount": 4,
    //     "myTeamName": "삼성 라이온즈",
    //     "teamCategoryName": "롯데 자이언츠",
    //   }
    // };
    Logger().d('BoardRepository updateOne:  $responseBody');
    return responseBody;
  }

  Future<Map<String, dynamic>> deleteOne(int boardId) async {
    Response response = await dio.delete("/s/api/boards/${boardId}");
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": {"deleteStatus": "삭제됨"}
    // };
    Logger().d('BoardRepository deleteOne:  $responseBody');
    return responseBody;
  }
}
