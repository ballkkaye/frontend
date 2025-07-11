import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/widgets/visit_record_img_thumbnail.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/visit_record_write_game_card.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_icon_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_text_form_field.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_toggle_btn.dart';
import 'package:flutter/material.dart';

class VisitRecordWriteForm extends StatelessWidget {
  final VisitRecord selectedGame;

  const VisitRecordWriteForm({
    super.key,
    required this.selectedGame,
  });

  @override
  Widget build(BuildContext context) {
    bool hasImage = true;
    List<String> results = ['승', '무', '패'];
    return Form(
      child: Column(
        children: [
          // 경기 카드
          VisitRecordWriteGameCard(selectedGame: selectedGame),
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
            onSelected: (value) {
              print(value);
            },
          ),
          SizedBox(height: 20),
          // 내용 입력 필드
          MTextFormField(
            hintText: "경기 기록을 자유롭게 적어주세요",
            maxLines: 6,
            maxLength: 1000,
            onChanged: (value) {},
            keyboardType: TextInputType.text,
          ),
          Spacer(),
          // 작성 완료 버튼
          MElevatedBtn(
            text: '완료',
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
