import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/auth/login_page/widgets/login_btn.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/onboarding_dummy.png',
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: SizedBox(
                  height: 105,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MText.h1("볼까예에서 경기를 예측하고\n직관 경험을 기록해보세요", color: MColor.kLabel.white),
                      SizedBox(height: 12),
                      Text(
                        '볼까예를 이용하기 위해서는 로그인이 필요해요',
                        style: TextStyle(color: MColor.kLabel.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              LoginBtn(),
            ],
          )
        ],
      ),
    );
  }
}
