import 'package:ballkkaye_frontend/_core/utils/m_fcm.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      Logger().d("1. dotenv 시작");
      await dotenv.load(fileName: ".env");

      Logger().d("2. intl 시작");
      await initializeDateFormatting();

      Logger().d("3. FCM 토큰 시작");
      await MFcm.initFcmToken();

      Logger().d("4. FCM initial message");
      FirebaseMessaging.instance.getInitialMessage();

      Logger().d("5. 이동");
      if (mounted) {
        Navigator.pushReplacementNamed(context, "/login");
      }
    } catch (e) {
      Logger().e("초기화 에러: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash.gif',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/login");
        },
      ),
    );
  }
}
