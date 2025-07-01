import 'package:ballkkaye_frontend/ui/pages/board/write_page/widgets/write_dropdown_field.dart';
import 'package:ballkkaye_frontend/ui/pages/board/write_page/widgets/write_img_selector.dart';
import 'package:ballkkaye_frontend/ui/pages/board/write_page/widgets/write_text_form_field.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/widgets/visit_record_btn.dart';
import 'package:flutter/material.dart';

class UpdateForm extends StatelessWidget {
  const UpdateForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String selectedTeam = '롯데 자이언츠';

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
        children: [
          // 팀 선택
          WriteDropdownField(
            value: selectedTeam, // TODO : 기존에 작성된 팀 불러오기
            hintText: '팀 선택',
            items: teams,
            onChanged: (p0) {},
          ),
          SizedBox(height: 12),
          // 제목
          WriteTextFormField(
            maxLines: 1,
            initialValue: '동행후기 써봄',
            isDense: true,
            hintText: '제목',
            onChanged: (p0) {},
          ),
          SizedBox(height: 12),
          // 이미지 버튼 (가로 스크롤)
          WriteImgSelector(),
          SizedBox(height: 12),
          // 내용
          WriteTextFormField(
            maxLines: 15,
            initialValue: '불러온 글 내용',
            hintText: '글 내용',
            onChanged: (p0) {},
          ),
          Spacer(),
          // 작성 버튼
          VisitRecordBtn(
            text: "수정",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
