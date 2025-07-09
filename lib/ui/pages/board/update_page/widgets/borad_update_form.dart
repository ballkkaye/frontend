import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/board_detail_board_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/board/write_page/widgets/borad_write_img_selector.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_dropdown_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardUpdateForm extends ConsumerWidget {
  Board board;

  BoardUpdateForm(this.board);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BoardDetailBoardVM vm = ref.read(boardDetailBoardProvider(board.boardId).notifier);
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
    String selectedTeam = teams[board.teamCategoryId - 1];
    return Form(
      child: Column(
        children: [
          // 팀 선택
          MDropdownBtn(
            hintText: '팀 선택',
            items: teams,
            value: selectedTeam, // TODO : 기존에 작성된 팀 불러오기
            onChanged: (value) {
              teamCategoryId:
              teams.indexOf(value!) + 1;
            },
          ),
          SizedBox(height: 12),
          // 제목
          MTextFormField(
            hintText: '제목을 입력하세요',
            maxLines: 1,
            initialValue: '동행후기 써봄',
            // TODO : 기존에 작성된 제목 불러오기
            onChanged: (value) {
              board = board.copyWith(title: value);
            },
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 12),
          // 이미지 버튼 (가로 스크롤)
          BoardWriteImgSelector(),
          SizedBox(height: 12),
          // 내용
          MTextFormField(
            hintText: '내용을 입력하세요',
            maxLines: 10,
            initialValue: '동행후기 써봄 내용~~~~~~',
            // TODO : 기존에 작성된 내용 불러오기
            isDense: false,
            onChanged: (value) {
              board = board.copyWith(content: value);
            },
            keyboardType: TextInputType.text,
          ),
          Spacer(),
          // 작성 버튼
          MElevatedBtn(
            text: '수정',
            onPressed: () {
              vm.updateOne(board);
            },
          ),
        ],
      ),
    );
  }
}
