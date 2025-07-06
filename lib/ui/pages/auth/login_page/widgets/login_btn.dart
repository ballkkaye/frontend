import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_naver_login/interface/types/naver_login_result.dart';
import 'package:flutter_naver_login/interface/types/naver_login_status.dart';
import 'package:flutter_naver_login/interface/types/naver_token.dart';
import 'package:logger/logger.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: SizedBox(
        height: 48,
        child: ElevatedButton(
          onPressed: () async {
            await _oauthLogin();
            await _sendAccessToken(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF03C759),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.zero,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: MText.button4_7('네이버 로그인', color: MColor.kLabel.white),
              ),
              Positioned(
                left: 16,
                child: MIcon.page.login.naverLogo,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _oauthLogin() async {
    try {
      final NaverLoginResult result = await FlutterNaverLogin.logIn();
      if (result.status == NaverLoginStatus.loggedIn) {
        Logger().d('네이버 로그인 성공: ${result.account?.email}');
      } else {
        Logger().d('네이버 로그인 실패: ${result.errorMessage}');
      }
    } catch (error) {
      Logger().d('로그인 중 오류 발생: $error');
    }
  }

  Future<void> _sendAccessToken(BuildContext context) async {
    try {
      final NaverToken token = await FlutterNaverLogin.getCurrentAccessToken();
      if (token.isValid()) {
        final accessToken = token.accessToken;
        Logger().d('accessToken: $accessToken');

        final userRepository = UserRepository();
        final result = await userRepository.oauthLogin(accessToken);
        Navigator.pushNamed(context, '/join/nickname');
      } else {
        Logger().d('유효하지 않은 토큰입니다.');
      }
    } catch (error) {
      Logger().d('토큰 처리 중 오류 발생: $error');
    }
  }
}
