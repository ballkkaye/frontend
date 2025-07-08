import 'package:logger/logger.dart';

class BoardRepository {
  Future<Map<String, dynamic>> getOne(int boardId) async {
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {
        "boardId": 1,
        "nickname": "cos",
        // "profileImageUrl": "/img/profile.png",
        "relativeTime": "8분 전",
        "myTeamName": "두산 베어스",
        "teamCategoryId": 3,
        "teamCategoryName": "키움 히어로즈",
        "title": "수정된 게시글 제목",
        "content": "이건 수정된 게시글 내용입니다.",
        "isOwner": true,
        "isLike": false,
        "likeCount": 0,
        // "images": [
        //   {"id": 1, "imageUrl": "https://s3.ap-northeast-2.amazonaws.com/bucket-name/images/img001.png"},
        //   {"id": 2, "imageUrl": "https://s3.ap-northeast-2.amazonaws.com/bucket-name/images/img002.png"},
        //   {"id": 3, "imageUrl": "https://s3.ap-northeast-2.amazonaws.com/bucket-name/images/new003.png"}
        // ],
        "replyItems": [
          {
            "replyId": 1,
            "nickname": "cos",
            "profileImg": "/img/profile.png",
            "relativeTime": "8분 전",
            "myTeamName": "두산 베어스",
            "content": "좋은 글이네요! 감사합니다.",
            "isOwner": true,
            "isLike": false,
            "likeCount": 0,
            "childReplies": [
              {
                "replyId": 2,
                "nickname": "harim",
                "profileImg": "/img/profile.png",
                "relativeTime": "1분 전",
                "myTeamName": "SSG 랜더스",
                "content": "좋은 글이네요! 감사합니다.",
                "parentReplyId": 1,
                "tagReplyId": null,
                "tagReplyName": null,
                "isOwner": false,
                "isLike": false,
                "likeCount": 0,
              },
              {
                "replyId": 3,
                "nickname": "jungwon",
                "profileImg": "/img/profile.png",
                "relativeTime": "방금",
                "myTeamName": "KIA 타이거즈",
                "content": "좋은 글이네요! 감사합니다.",
                "parentReplyId": 1,
                "tagReplyId": 2,
                "tagReplyName": "harim",
                "isOwner": false,
                "isLike": false,
                "likeCount": 0,
              }
            ]
          },
          {
            "replyId": 4,
            "nickname": "jungwon",
            "profileImg": "/img/profile.png",
            "relativeTime": "4분 전",
            "myTeamName": "KIA 타이거즈",
            "content": "좋은 글이네요! 감사합니다.",
            "isOwner": true,
            "isLike": false,
            "likeCount": 0,
          }
        ]
      }
    };
    return responseBody;
  }

  Future<Map<String, dynamic>> getList() async {
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {
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
    Logger().d(responseBody);
    return responseBody;
  }
}
