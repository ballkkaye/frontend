import 'package:logger/logger.dart';

class UserRepository {
  Future<Map<String, dynamic>> oauthLogin(String accessToken) async {
    // Response response =
    //     await dio.post("/oauth/login", data: {"accessToken": accessToken});
    // final responseBody = response.data;
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {
        "accessToken":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhY2Nlc3MtdG9rZW4iLCJuaWNrbmFtZSI6IuuwlOychOqyjDI2MjM2NCIsInVzZXJyb2xlIjoiVVNFUiIsImlkIjo4LCJleHAiOjE3NTE4NTM4ODJ9.Dxq7DtSQh8dphkpt8PRzH5ySzBui2YXzBs_8GitpNFgnfjDwpEzouAiiaDl96TJiCR3hNQUkMewdmrR2m6L2Gw",
        "username": "NAVER_j6Ccsr_gsenBwfXBf1wHK5pS9NtEgwBnPXdnEakhEV0",
        "name": "김주희",
        "nickname": "바위게262364",
        "teamId": null,
        "phoneNumber": "010-3268-9720",
        "email": "wngml9720@naver.com",
        "birthDate": "2000-08-26",
        "gender": "FEMALE",
        "profileUrl":
            "https://ssl.pstatic.net/static/pwe/address/img_profile.png",
        "providerType": "NAVER",
        "userRole": "USER",
        "isNewUser": true // 신규회원
      }
    };
    return responseBody;
  }

  Future<Map<String, dynamic>> writeAdditionalInfo(
      Map<String, dynamic> data) async {
    // Response response = await dio.put("/s/user/addtion-info", data: data);
    // final responseBody = response.data;
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {
        "accessToken":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhY2Nlc3MtdG9rZW4iLCJuaWNrbmFtZSI6IuuwlOychOqyjDI2MjM2NCIsInVzZXJyb2xlIjoiVVNFUiIsImlkIjo4LCJleHAiOjE3NTE4NTM4ODJ9.Dxq7DtSQh8dphkpt8PRzH5ySzBui2YXzBs_8GitpNFgnfjDwpEzouAiiaDl96TJiCR3hNQUkMewdmrR2m6L2Gw",
        "username": "NAVER_j6Ccsr_gsenBwfXBf1wHK5pS9NtEgwBnPXdnEakhEV0",
        "name": "김주희",
        "nickname": "바위게262364",
        "teamId": 7,
        "phoneNumber": "010-3268-9720",
        "email": "wngml9720@naver.com",
        "birthDate": "2000-08-26",
        "gender": "FEMALE",
        "profileUrl":
            "https://ssl.pstatic.net/static/pwe/address/img_profile.png",
        "providerType": "NAVER",
        "userRole": "USER",
        "isNewUser": false // 회원가입 완료 후 기존회원
      }
    };
    Logger().d(responseBody);
    return responseBody;
  }
}
