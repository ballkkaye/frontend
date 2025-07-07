import 'package:logger/logger.dart';

class BoardRepository {
  Future<Map<String, dynamic>> getOne(int boardId) async {
    // Response response = await dio.get("/s/api/boards/${boardId}");
    // final responseBody = response.data; // = Map<String, dynamic> responseBody = response.data;
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {
        "boardId": 12,
        "nickname": "cos",
        "profileImageUrl": "/img/profile.png",
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
        //   {
        //     "id": 1,
        //     "imageUrl": "https://s3.ap-northeast-2.amazonaws.com/bucket-name/images/img001.png"
        //   },
        //   {
        //     "id": 2,
        //     "imageUrl": "https://s3.ap-northeast-2.amazonaws.com/bucket-name/images/img002.png"
        //   },
        //   {
        //     "id": 3,
        //     "imageUrl": "https://s3.ap-northeast-2.amazonaws.com/bucket-name/images/new003.png"
        //   }
        // ],
      }
    };
    Logger().d(responseBody);
    return responseBody;
  }
}
