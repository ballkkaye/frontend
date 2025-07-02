import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_dropdown_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_tag.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_text_form_field.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_toggle_btn.dart';
import 'package:flutter/material.dart';

class UserMatchWriteForm extends StatelessWidget {
  const UserMatchWriteForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> genders = ['남성', '여성', '무관'];
    List<String> ages = ['10대 이상', '20대 이상', '30대 이상', '40대 이상', '50대 이상'];
    List<String> teams = ['롯데 자이언츠', '한화 이글스']; // 해당 경기의 두 팀 중 하나 선택
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 경기 일정 태그
          Center(
            child: MTag(
              label: '2025.07.02 한화 이글스 vs 롯데 자이언츠 (사직)',
              fillColor: MColor.kFill.normal,
              textColor: MColor.kLabel.normal,
            ),
          ),
          SizedBox(height: 12),

          // 희망 응원팀
          Row(
            children: [
              MText.h3_6('희망 응원팀', color: MColor.kLabel.normal),
              Padding(
                padding: EdgeInsetsGeometry.directional(top: 1, start: 10),
                child: Transform.scale(
                  scale: 0.96,
                  child: Checkbox(
                    value: true,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // 여백 제거
                    visualDensity: VisualDensity.compact,
                    fillColor: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.selected)) {
                        return MColor.kPrimary.strong; // 체크된 상태일 때 박스 색
                      }
                    }),
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.directional(bottom: 0),
                child: MText.label1_5('같은 팀이면 좋겠어요', color: MColor.kPrimary.strong),
              )
            ],
          ),
          SizedBox(height: 6),
          MDropdownBtn(
            hintText: '응원팀',
            items: teams,
            onChanged: (value) {},
          ),
          SizedBox(height: 12),

          // 희망 연령
          MText.h3_6('희망 연령', color: MColor.kLabel.normal),
          SizedBox(height: 6),
          MDropdownBtn(
            hintText: '연령',
            items: ages,
            onChanged: (value) {},
          ),
          SizedBox(height: 12),

          // 희망 성별
          MText.h3_6('희망 성별', color: MColor.kLabel.normal),
          SizedBox(height: 6),
          MToggleBtn(
            options: genders,
            selectedValue: '여성', // TODO: 나중에는 없앤다 지금은 선택된게 보이도록 하기 위함
            onSelected: (value) {
              print(value);
            },
          ),
          SizedBox(height: 12),

          // 동행글 제목
          MText.h3_6('모집글 작성', color: MColor.kLabel.normal),
          SizedBox(height: 6),
          MTextFormField(
            hintText: '제목',
            onChanged: (value) {
              print(value);
            },
          ),
          SizedBox(height: 6),
          // 동행글 내용
          MTextFormField(
            hintText: '글 내용',
            maxLines: 10,
            isDense: false,
            onChanged: (value) {},
          ),
          SizedBox(height: 12),

          // 채팅방 인원
          MText.h3_6('채팅방 인원', color: MColor.kLabel.normal),
          SizedBox(height: 6),
          MTextFormField(
            hintText: '인원 수',
            keyboardType: TextInputType.number,
            onChanged: (value) {
              print(value);
            },
          ),
          SizedBox(height: 12),

          // 작성 완료 버튼
          MElevatedBtn(
            text: '완료',
            onPressed: () {
              Navigator.pushNamed(context, "/user-match/detail");
            },
          ),
        ],
      ),
    );
  }
}
