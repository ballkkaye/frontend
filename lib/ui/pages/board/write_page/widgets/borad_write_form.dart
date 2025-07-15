import 'package:ballkkaye_frontend/ui/pages/board/list_page/board_list_board_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/board/write_page/board_write_fm.dart';
import 'package:ballkkaye_frontend/ui/pages/board/write_page/widgets/borad_write_img_selector.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_dropdown_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardWriteForm extends ConsumerWidget {
  BoardWriteForm({super.key});

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

  @override
  Widget build(BuildContext contextm, WidgetRef ref) {
    BoardWriteFM fm = ref.read(boardWriteProvider.notifier);
    BoardWriteModel model = ref.watch(boardWriteProvider);
    BoardListBoardVM vm = ref.read(boardListBoardProvider.notifier);

    return Form(
      child: Column(
        children: [
          // 팀 선택
          MDropdownBtn(
            hintText: '팀 선택',
            items: teams,
            onChanged: (value) {
              fm.teamId(teams.indexOf(value!) + 1);
            },
          ),
          SizedBox(height: 12),
          // 제목
          MTextFormField(
            hintText: '제목을 입력하세요',
            maxLines: 1,
            initialValue: '',
            onChanged: (value) {
              fm.title(value);
            },
          ),
          SizedBox(height: 12),
          // 이미지 버튼 (가로 스크롤)
          BoardWriteImgSelector(fm: fm),
          SizedBox(height: 12),
          // 내용
          MTextFormField(
            hintText: '내용을 입력하세요',
            maxLines: 10,
            initialValue: '',
            isDense: false,
            onChanged: (value) {
              fm.content(value);
            },
          ),
          Spacer(),
          // 작성 버튼
          MElevatedBtn(
            text: '완료',
            onPressed: () {
              vm.write(model.teamId, model.title, model.content, model.imgUrl);
            },
          ),
        ],
      ),
    );
  }
}
