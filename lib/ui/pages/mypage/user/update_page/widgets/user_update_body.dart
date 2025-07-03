import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/user/update_page/widgets/user_update_select_btn.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/user/update_password_page/user_update_password_page.dart';
import 'package:flutter/material.dart';

import 'user_update_labeled_field.dart';
import 'user_update_outlinedInput_field.dart';

class UserUpdateBody extends StatelessWidget {
  const UserUpdateBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Container(
          width: 360,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: MColor.kShadow.normal,
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 125,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Stack(
                            children: [
                              // 배경 (동그라미 + 이미지 아이콘)
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(child: MIcon.page.record.image),
                              ),

                              // 오른쪽 아래 플러스 아이콘
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  UserUpdateLabeledField(
                    label: '닉네임',
                    child: UserUpdateOutlinedinputField(
                      hintText: 'ssar',
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  UserUpdateLabeledField(
                    label: '내 응원팀',
                    child: UserUpdateSelectBtn(
                      hintText: '롯데 자이언츠',
                      options: [
                        '롯데 자이언츠',
                        '삼성라이온즈',
                        'LG 트윈스',
                        '두산 베어스',
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => UserUpdatePasswordPage()),
                          );
                        },
                        child: MText.label1_5('비밀번호 변경하기', color: MColor.kLabel.normal),
                      ),
                    ],
                  ),
                  // 하단 카드
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
