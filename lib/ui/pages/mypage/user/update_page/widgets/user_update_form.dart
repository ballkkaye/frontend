import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/user/update_page/widgets/update_profile_img_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_dropdown_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_text_form_field.dart';
import 'package:flutter/material.dart';

class UserUpdateForm extends StatelessWidget {
  const UserUpdateForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> teams = [
      'SSG 랜더스',
      '키움 히어로즈',
      'LG 트윈스',
      'KT 위즈',
      'NC 다이노스',
      'KIA 타이거즈',
      '롯데 자이언츠',
      '삼성 라이온즈',
      '두산 베어스',
      '한화 이글스',
    ];

    return Form(
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: EdgeInsetsGeometry.directional(start: 14, end: 14, top: 30, bottom: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 프로필 사진 수정 버튼
                  UpdateProfileImgBtn(),
                  SizedBox(height: 20),

                  // 닉네임 수정
                  MText.normal6_500('닉네임', color: MColor.kLabel.normal),
                  SizedBox(height: 6),
                  MTextFormField(
                    hintText: '닉네임',
                    initialValue: 'ssar',
                    onChanged: (p0) {},
                  ),
                  SizedBox(height: 12),

                  // 응원팀 수정
                  MText.normal6_500('내 응원팀', color: MColor.kLabel.normal),
                  SizedBox(height: 6),
                  MDropdownBtn(
                    hintText: '내 응원팀',
                    value: '롯데 자이언츠',
                    items: teams,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
          // 수정 완료 버튼
          Spacer(),
          MElevatedBtn(
            text: '수정',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
