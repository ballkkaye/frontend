import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/widgets/visit_record_game.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/write_icon_btn.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/write_img_thumbnail.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/write_result_selector.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_text_form_field.dart';
import 'package:flutter/material.dart';

class UpdateBody extends StatelessWidget {
  const UpdateBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool hasImage = true;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Form(
        child: Column(
          children: [
            // 경기 카드
            VisitRecordGame(),
            SizedBox(height: 20),
            // 사진 첨부 버튼
            WriteIconBtn(),
            SizedBox(height: 20),
            Visibility(
              visible: hasImage,
              child: Column(
                children: [
                  WriteThumbnail(),
                  SizedBox(height: 20),
                ],
              ),
            ),
            // 승 무 패 선택 버튼
            WriteResultSelector(),
            SizedBox(height: 20),
            // 내용 입력 필드
            MTextFormField(
              hintText: "경기 기록을 자유롭게 적어주세요",
              maxLines: 6,
              maxLength: 1000,
              initialValue: "경기 진짜 재밌었다~",
              onChanged: (value) {},
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
      ),
    );
  }
}
