import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/gvm/session_gvm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_naver_login/interface/types/naver_login_result.dart';
import 'package:flutter_naver_login/interface/types/naver_login_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class LoginBtn extends ConsumerWidget {
  const LoginBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionGVM gvm = ref.read(sessionProvider.notifier);
    return Padding(
      padding: EdgeInsets.all(16),
      child: SizedBox(
        height: 48,
        child: ElevatedButton(
          onPressed: () async {
            final accessToken = await _oauthLogin();
            if (accessToken != null) {
              await gvm.oauthLogin(accessToken);
            }
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

  Future<String?> _oauthLogin() async {
    try {
      final NaverLoginResult result = await FlutterNaverLogin.logIn();
      Logger().d('네이버 로그인 result: ${result}');
      if (result.status == NaverLoginStatus.loggedIn) {
        final naverToken = await FlutterNaverLogin.getCurrentAccessToken();
        if (naverToken.isValid()) {
          Logger().d('네이버 로그인 성공: ${result.account?.email}');
          Logger().d('accessToken: ${naverToken.accessToken}');
          return naverToken.accessToken;
        } else {
          Logger().d('토큰이 유효하지 않음');
        }
      } else {
        Logger().d('네이버 로그인 실패: ${result.errorMessage}');
      }
    } catch (error) {
      Logger().d('로그인 중 오류 발생: $error');
    }
    return null;
  }
}
