import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/widgets/visit_record_game.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/widgets/visit_record_img_thumbnail.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_icon_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_text_form_field.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_toggle_btn.dart';
import 'package:flutter/material.dart';

class VisitRecordUpdateForm extends StatelessWidget {
  const VisitRecordUpdateForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool hasImage = true;
    List<String> results = ['승', '무', '패'];

    return Form(
      child: Column(
        children: [
          // 경기 카드
          VisitRecordGame(),
          SizedBox(height: 20),
          // 사진 첨부 버튼
          MIconBtn(
            height: 49,
            icon: MIcon.page.record.camera,
            text: '사진 첨부하기',
            onPressed: () {
              // TODO : image_picker 사용해서 이미지 첨부하기 기능 구현
            },
            textColor: MColor.kLabel.alternative,
          ),
          SizedBox(height: 20),
          Visibility(
            visible: hasImage,
            child: Column(
              children: [
                VisitRecordThumbnail(),
                SizedBox(height: 20),
              ],
            ),
          ),
          // 승 무 패 선택 버튼
          MToggleBtn(
            options: results,
            selectedValue: '승',
            onSelected: (p0) {},
          ),
          SizedBox(height: 20),
          // 내용 입력 필드
          MTextFormField(
            hintText: "경기 기록을 자유롭게 적어주세요",
            maxLines: 6,
            maxLength: 1000,
            initialValue: "경기 진짜 재밌었다~",
            onChanged: (value) {},
            keyboardType: TextInputType.text,
          ),
          Spacer(),
          // 수정 완료 버튼
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
