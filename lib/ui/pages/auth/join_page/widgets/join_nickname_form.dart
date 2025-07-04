import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_text_form_field.dart';
import 'package:flutter/material.dart';

class JoinNicknameForm extends StatelessWidget {
  const JoinNicknameForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MText.h3_6('닉네임을 입력해주세요', color: MColor.kLabel.normal),
          SizedBox(height: 12),
          MTextFormField(
            hintText: '닉네임',
            onChanged: (p0) {},
          ),
          Spacer(),
          MElevatedBtn(
            text: '다음',
            onPressed: () {
              Navigator.pushNamed(context, "/join/team");
            },
          ),
        ],
      ),
    );
  }
}
