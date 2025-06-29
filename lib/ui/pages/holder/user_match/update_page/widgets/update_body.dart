import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/update_page/widgets/update_gender_toggle.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/update_page/widgets/update_select_btn.dart';
import 'package:flutter/material.dart';

import '../../write_page/widgets/write_outlined_Input_field.dart';
import 'update_labeled_field.dart';

class UpdateBody extends StatelessWidget {
  const UpdateBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MText.label1_5('2025.06.28 한화 vs 롯데',
                        color: MColor.kLabel.normal),
                  ],
                ),
                const SizedBox(height: 10),
                UpdateLabeledField(
                  label: '채팅방 인원',
                  child: WriteOutlinedInputField(
                    hintText: '인원 수',
                    keyboardType: TextInputType.number,
                  ),
                ),
                UpdateLabeledField(
                  label: '희망 성별',
                  child: Row(
                    children: [
                      Expanded(child: UpdateGenderToggle()),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
                UpdateLabeledField(
                  label: '희망 연령',
                  child: UpdateSelectBtn(
                    hintText: '연령',
                    options: [
                      '~20대',
                      '20대 ~ 30대',
                      '30대 ~ 40대',
                      '40대 이상',
                      '연령 무관'
                    ],
                  ),
                ),
                UpdateLabeledField(
                  label: '희망 응원팀',
                  child: UpdateSelectBtn(
                    hintText: '희망 응원팀',
                    options: ['LG 트윈스', '두산 베어스'],
                    onChanged: (value) {
                      print('선택한 팀: $value');
                    },
                  ),
                ),
                UpdateLabeledField(
                  label: '모집 글 작성',
                  child: WriteOutlinedInputField(
                    hintText: '제목',
                  ),
                ),
                UpdateLabeledField(
                  child: WriteOutlinedInputField(
                    hintText: '글 내용',
                    maxLines: 7,
                    maxLength: 1000,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MColor.kPrimary.strong,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: MText.button2('완료', color: MColor.kLabel.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
