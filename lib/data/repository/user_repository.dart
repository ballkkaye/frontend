import 'package:ballkkaye_frontend/_core/utils/m_http.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class UserRepository {
  Future<Map<String, dynamic>> oauthLogin(
      String accessToken, String fcmToken) async {
    Response response = await dio.post("/oauth/login",
        data: {"accessToken": accessToken, "fcmToken": fcmToken});
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": {
    //     "accessToken":
    //         "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhY2Nlc3MtdG9rZW4iLCJuaWNrbmFtZSI6IuuwlOychOqyjDg4NzUyNSIsInVzZXJyb2xlIjoiVVNFUiIsImlkIjo4LCJleHAiOjE3NTE5Mzg3NTB9.qkO8tbdL-ks3epVNzv7uniZ9BiVzvGYzyF_NjnSsxnyq9IQ55uROtp_NOgxSAht-7DILrIivnT5G4VJ52eaI-g",
    //     "isNewUser": true, // 신규회원
    //     "username": "NAVER_j6Ccsr_gsenBwfXBf1wHK5pS9NtEgwBnPXdnEakhEV0",
    //     "name": "김주희",
    //     "nickname": "바위게887525",
    //     "teamId": null,
    //     "phoneNumber": "010-3268-9720",
    //     "email": "wngml9720@naver.com",
    //     "birthDate": "2000-08-26",
    //     "gender": "FEMALE",
    //     "profileUrl":
    //         "https://ssl.pstatic.net/static/pwe/address/img_profile.png",
    //     "providerType": "NAVER",
    //     "userRole": "USER"
    //   }
    // };
    Logger().d('UserRepository의 oauthLogin: ${responseBody}');
    return responseBody;
  }

  Future<Map<String, dynamic>> writeAdditionalInfo(
      Map<String, dynamic> data) async {
    Response response = await dio.put("/s/user/addtion-info", data: data);
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": {
    //     "username": "NAVER_j6Ccsr_gsenBwfXBf1wHK5pS9NtEgwBnPXdnEakhEV0",
    //     "name": "김주희",
    //     "nickname": "jh",
    //     "teamId": 7,
    //     "teamName": "롯데 자이언츠",
    //     "phoneNumber": "010-3268-9720",
    //     "email": "wngml9720@naver.com",
    //     "birthDate": "2000-08-26",
    //     "gender": "FEMALE",
    //     "profileUrl":
    //         "https://ssl.pstatic.net/static/pwe/address/img_profile.png",
    //     "providerType": "NAVER",
    //     "userRole": "USER"
    //   }
    // };
    Logger().d('UserRepository의 writeAdditionalInfo: ${responseBody}');
    return responseBody;
  }

  Future<Map<String, dynamic>> update(Map<String, dynamic> data) async {
    Response response = await dio.put("/s/api/users", data: data);
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": {
    //     "username": "NAVER_j6Ccsr_gsenBwfXBf1wHK5pS9NtEgwBnPXdnEakhEV0",
    //     "name": "김주희",
    //     "nickname": "jh6",
    //     "teamId": 6,
    //     "teamName": "삼성 라이온즈",
    //     "phoneNumber": "010-3268-9720",
    //     "email": "wngml9720@naver.com",
    //     "birthDate": "2000-08-26",
    //     "gender": "FEMALE",
    //     "profileUrl":
    //         "https://ssl.pstatic.net/static/pwe/address/img_profile_6.png",
    //     "providerType": "NAVER",
    //     "userRole": "USER"
    //   }
    // };
    Logger().d('UserRepository의 update: ${responseBody}');
    return responseBody;
  }
}
