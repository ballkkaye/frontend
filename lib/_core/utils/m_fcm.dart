import 'package:ballkkaye_frontend/_core/utils/m_device.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

class MFcm {
  /// FCM 토큰 발급 및 저장
  static Future<void> initFcmToken() async {
    final messaging = FirebaseMessaging.instance;
    final token = await messaging.getToken();
    Logger().i("FCM token 발급됨: $token");

    if (token != null) {
      Logger().d('FCM Token: $token');
      saveFcmToken(token);
    } else {
      Logger().w("FCM Token X : $token");
    }

    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      Logger().d('FCM Token refreshed: $newToken');
      saveFcmToken(newToken);
      // TODO: 서버로 갱신된 토큰 보내기 -> 서버 api 필요
    });
  }
}
