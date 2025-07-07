import 'package:ballkkaye_frontend/_core/utils/m_http.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class UserRepository {
  Future<Map<String, dynamic>> oauthLogin(String accessToken) async {
    Response response = await dio.post("/api/oauth/login", data: {"accessToken": accessToken});
    final responseBody = response.data;
    Logger().d(responseBody);
    return responseBody;
  }
}
