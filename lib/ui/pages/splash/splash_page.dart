import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/utils/m_fcm.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _isInitialized = false;
  bool _isAnimationLoaded = false;
  Duration _animationDuration = Duration.zero;

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

      Logger().d("✅ 초기화 완료");

      setState(() {
        _isInitialized = true;
      });

      _tryNavigate();
    } catch (e) {
      Logger().e("초기화 에러: $e");
    }
  }

  void _tryNavigate() {
    if (_isInitialized && _isAnimationLoaded) {
      Future.delayed(_animationDuration, () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, "/login");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColor.kPrimary.alternative,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.50, -0.00),
                  end: Alignment(0.50, 1.00),
                  colors: [
                    Color(0xFF4FE8C1),
                    Color(0xFF4EE1BB),
                    Color(0xFF4BD7B3)
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Lottie.asset(
              'assets/animation/splash_logo_kr.json',
              repeat: false,
              animate: true,
              fit: BoxFit.cover,
              onLoaded: (composition) {
                _animationDuration = composition.duration;
                _isAnimationLoaded = true;
                _tryNavigate();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/login");
        },
      ),
    );
  }
}
