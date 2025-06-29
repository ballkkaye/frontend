import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/widgets/visit_record_btn.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/widgets/visit_record_game.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/write_icon_btn.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/write_img_thumbnail.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/write_result_selector.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/write_text_field.dart';
import 'package:flutter/material.dart';

class WriteBody extends StatelessWidget {
  const WriteBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool hasImage = true;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
          WriteTextField(),
          Spacer(),
          // 작성완료 버튼
          VisitRecordBtn(
            text: "완료",
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
