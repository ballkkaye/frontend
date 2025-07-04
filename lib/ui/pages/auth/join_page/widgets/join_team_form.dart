import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_dropdown_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:flutter/material.dart';

class JoinTeamForm extends StatelessWidget {
  const JoinTeamForm({
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MText.h3_6('응원팀을 선택해주세요', color: MColor.kLabel.normal),
          SizedBox(height: 12),
          MDropdownBtn(
            hintText: '응원팀 선택',
            items: teams,
            onChanged: (value) {},
          ),
          Spacer(),
          MElevatedBtn(
            text: '완료',
            onPressed: () {
              Navigator.pushNamed(context, "/main-holder");
            },
          ),
        ],
      ),
    );
  }
}
