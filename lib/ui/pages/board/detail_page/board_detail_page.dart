import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/board_detail_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/board_detail_body.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/borad_detail_reply_input_bar.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_more_option_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardDetailPage extends ConsumerStatefulWidget {
  const BoardDetailPage({
    super.key,
  });

  @override
  ConsumerState<BoardDetailPage> createState() => _BoardDetailPageState();
}

class _BoardDetailPageState extends ConsumerState<BoardDetailPage> {
  late int boardId; // 게시글 ID
  late String accessToken; // 토큰
  TextEditingController _replyController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // arguments에서 boardId, accessToken 꺼내오기
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    boardId = args['boardId']; // 게시글 ID
    accessToken = args['accessToken']; // 토큰

    // 상세 API 호출
    ref.read(boardDetailProvider.notifier).getBoardDetail(
          accessToken: accessToken,
          boardId: boardId,
        );
  }

  @override
  Widget build(BuildContext context) {
    final detail = ref.watch(boardDetailProvider);

    return Scaffold(
      appBar: _appbar(context, detail?.isOwner ?? false),
      body: detail == null
          ? const Center(child: CircularProgressIndicator())
          : BoardDetailBody(
              replyController: _replyController,
              detail: detail,
            ),
      // 댓글 입력창
      bottomNavigationBar: BoardDetailReplyInputBar(replyController: _replyController),
    );
  }

  AppBar _appbar(BuildContext context, bool isOwner) {
    return AppBar(
      centerTitle: true,
      title: MText.h1('커뮤니티', color: MColor.kLabel.normal),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      actions: [
        // 더보기 버튼
        Visibility(
          visible: isOwner, // bool isBoardOwner = true; // 게시글 주인 판별 -> 더보기 버튼
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
