import 'package:logger/logger.dart';

class TeamRepository {
  Future<Map<String, dynamic>> getList() async {
    // Response response = await dio.get("/api/teams");
    // final responseBody = response.data;
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": [
        {"teamId": 1, "teamName": "LG 트윈스"},
        {"teamId": 2, "teamName": "두산 베어스"},
        {"teamId": 3, "teamName": "키움 히어로즈"},
        {"teamId": 4, "teamName": "SSG 랜더스"},
        {"teamId": 5, "teamName": "KIA 타이거즈"},
        {"teamId": 6, "teamName": "삼성 라이온즈"},
        {"teamId": 7, "teamName": "롯데 자이언츠"},
        {"teamId": 8, "teamName": "한화 이글스"},
        {"teamId": 9, "teamName": "NC 다이노스"},
        {"teamId": 10, "teamName": "KT 위즈"}
      ]
    };
    Logger().d(responseBody);
    return responseBody;
  }
}
