import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

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
          onPressed: () {
            Navigator.pushNamed(context, "/join");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFE812),
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
                child: MText.button4_7('카카오톡 로그인', color: MColor.kLabel.normal),
              ),
              Positioned(
                left: 16,
                child: MIcon.page.login.kakaoLogo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
