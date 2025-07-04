import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/borad_detail_reply_item.dart';
import 'package:flutter/material.dart';

class BoardDetailReplyArea extends StatelessWidget {
  const BoardDetailReplyArea({
    super.key,
    required TextEditingController replyController,
  }) : _replyController = replyController;

  final TextEditingController _replyController;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> replies = [
      {
        'id': 1,
        'parentId': null,
        'author': 'ssar',
        'content': '댓글 1입니다',
        'time': '3분 전',
        'likeCount': 5,
        'replyCount': 5,
        'isReplyOwner': false,
      },
      {
        'id': 2,
        'parentId': 1,
        'author': 'cos',
        'content': '대댓글입니다',
        'time': '2분 전',
        'likeCount': 5,
        'replyCount': 5,
        'isReplyOwner': true,
      },
      {
        'id': 3,
        'parentId': 1,
        'author': 'cos',
        'content': '대댓글입니다',
        'time': '2분 전',
        'likeCount': 5,
        'replyCount': 5,
        'isReplyOwner': false,
      },
      {
        'id': 4,
        'parentId': null,
        'author': 'cos',
        'content': '대댓글입니다',
        'time': '2분 전',
        'likeCount': 5,
        'replyCount': 5,
        'isReplyOwner': false,
      },
    ]; // TODO : 수정 및 삭제 필요 (참고용)

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MText.normal6_5('댓글', color: MColor.kLabel.neutral),
          ...replies.map((reply) => BoardDetailReplyItem(
                reply: reply,
                onMention: (tagReplyName) {
                  _replyController.text = tagReplyName;
                  _replyController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _replyController.text.length),
                  );
                },
              )), // TODO : 루트 댓글 입력 / 부모가 있는 댓글 입력
        ],
      ),
    );
  }
}
