import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/board_detail_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/board_detail_body.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/borad_detail_reply_input_bar.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_more_option_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardDetailPage extends ConsumerWidget {
  int boardId;

  BoardDetailPage(this.boardId);

  TextEditingController _replyController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BoardDetailModel? model = ref.watch(boardDetailProvider(boardId));
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: _appbar(context, model),
        body: BoardDetailBody(
          board: model.board,
          replyController: _replyController,
        ),
        // 댓글 입력창
        bottomNavigationBar: BoardDetailReplyInputBar(replyController: _replyController),
      );
    }
  }

  AppBar _appbar(BuildContext context, model) {
    return AppBar(
      centerTitle: true,
      title: MText.h1('커뮤니티', color: MColor.kLabel.normal),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      actions: [
        // 더보기 버튼
        Visibility(
          visible: model.board.isOwner, // bool isBoardOwner = true; // 게시글 주인 판별 -> 더보기 버튼
          child: MMoreOptionBtn(
            icon: MIcon.nav.top.dotHorizontal,
            onUpdate: () {
              Navigator.popAndPushNamed(context, '/board/update');
            },
            alertTitle: '게시글 삭제',
            alertContent: '게시글을 삭제하시겠습니까?',
            onAlertConfirm: () {},
            // 다이얼로그 닫힌 뒤 동작
            onAlertCancel: () {},
            // 다이얼로그 닫힌 뒤 동작
            alertConfirmText: '삭제',
            alertCancelText: '취소',
          ),
        ),
      ],
    );
  }
}
