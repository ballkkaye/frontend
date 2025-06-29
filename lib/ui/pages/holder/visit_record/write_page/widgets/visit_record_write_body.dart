import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/widgets/visit_record_btn.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/widgets/visit_record_game.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/visit_record_write_icon_btn.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/visit_record_write_img_thumbnail.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/visit_record_write_result_selector.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/visit_record_write_text_field.dart';
import 'package:flutter/material.dart';

class VisitRecordWriteBody extends StatelessWidget {
  const VisitRecordWriteBody({
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
          VisitRecordWriteIconBtn(),
          SizedBox(height: 20),
          Visibility(
            visible: hasImage,
            child: Column(
              children: [
                VisitRecordWriteThumbnail(),
                SizedBox(height: 20),
              ],
            ),
          ),
          // 승 무 패 선택 버튼
          VisitRecordWriteResultSelector(),
          SizedBox(height: 20),
          // 내용 입력 필드
          VisitRecordWriteTextField(),
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
