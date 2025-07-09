import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/auth/join_page/join_fm.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinNicknameForm extends ConsumerWidget {
  const JoinNicknameForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    JoinFM fm = ref.read(joinProvider.notifier);

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MText.h3_6('닉네임을 입력해주세요', color: MColor.kLabel.normal),
          SizedBox(height: 12),
          MTextFormField(
            hintText: '닉네임',
            onChanged: (value) {
              fm.nickname(value);
            },
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
