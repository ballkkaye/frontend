import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/user/update_password_page/widgets/user_update_outlinedInput_field.dart';
import 'package:flutter/material.dart';


class UserUpdatePasswordBody extends StatelessWidget {
  const UserUpdatePasswordBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MText.h3_6('변경할 비밀번호를 입력해주세요'),
          const SizedBox(height: 16),
          UserUpdateOutlinedinputField(
            obscureText: true,
            hintText: '비밀번호',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 26),
          UserUpdateOutlinedinputField(
            obscureText: true,
            hintText: '비밀번호 확인',
            keyboardType: TextInputType.text,
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                // TODO: 비밀번호 변경 API 호출
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MColor.kPrimary.heavy,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: MText.h3_7('완료', color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}