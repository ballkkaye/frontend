import 'package:logger/logger.dart';

class TeamRepository {
  Future<Map<String, dynamic>> getList() async {
    // Response response = await dio.get("/api/teams");
    // final responseBody = response.data;
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": [
        {
          "teamId": 1,
          "teamName": "LG 트윈스",
          "teamLogo": "https://cdn.pixabay.com/photo/2023/02/04/14/18/underwater-7767303_640.jpg", //테스트용 임시이미지링크
          "teamRank": 1,
        },
        {
          "teamId": 2,
          "teamName": "두산 베어스",
          "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/4/4f/LG_Twins.png",
          "teamRank": 2,
        },
        {
          "teamId": 3,
          "teamName": "키움 히어로즈",
          "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/4/4f/LG_Twins.png",
          "teamRank": 3,
        },
        {
          "teamId": 4,
          "teamName": "SSG 랜더스",
          "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/4/4f/LG_Twins.png",
          "teamRank": 4,
        },
        {
          "teamId": 5,
          "teamName": "KIA 타이거즈",
          "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/4/4f/LG_Twins.png",
          "teamRank": 5,
        },
        {
          "teamId": 6,
          "teamName": "삼성 라이온즈",
          "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/4/4f/LG_Twins.png",
          "teamRank": 6,
        },
        {
          "teamId": 7,
          "teamName": "롯데 자이언츠",
          "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/4/4f/LG_Twins.png",
          "teamRank": 7,
        },
        {
          "teamId": 8,
          "teamName": "한화 이글스",
          "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/4/4f/LG_Twins.png",
          "teamRank": 8,
        },
        {
          "teamId": 9,
          "teamName": "NC 다이노스",
          "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/4/4f/LG_Twins.png",
          "teamRank": 9,
        },
        {
          "teamId": 10,
          "teamName": "KT 위즈",
          "teamLogo": "https://upload.wikimedia.org/wikipedia/ko/4/4f/LG_Twins.png",
          "teamRank": 10,
        }
      ]
    };
    Logger().d('TeamRepository의 getList: ${responseBody}');
    return responseBody;
  }
}
