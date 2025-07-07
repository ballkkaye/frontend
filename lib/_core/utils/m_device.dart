import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const secureStorage = FlutterSecureStorage();

// accessToken 저장
Future<void> saveAccessToken(String? accessToken) async {
  await secureStorage.write(key: "accessToken", value: accessToken);
}

// accessToken 조회
Future<String?> getAccessToken() async {
  return await secureStorage.read(key: "accessToken");
}

// accessToken 삭제
Future<void> deleteAccessToken() async {
  await secureStorage.delete(key: "accessToken");
}
