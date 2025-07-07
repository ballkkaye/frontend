import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/reply.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/borad_detail_reply_item.dart';
import 'package:flutter/material.dart';

class BoardDetailReplyArea extends StatelessWidget {
  final List<ReplyItem> replies;
  final TextEditingController replyController;

  const BoardDetailReplyArea({super.key, required this.replies, required this.replyController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MText.normal6_5('댓글', color: MColor.kLabel.neutral),
          ...replies.map((reply) => BoardDetailReplyItem(
                reply: reply,
                onMention: (tagReplyName) {
                  replyController.text = tagReplyName;
                  replyController.selection = TextSelection.fromPosition(
                    TextPosition(offset: replyController.text.length),
                  );
                },
              )), // TODO : 루트 댓글 입력 / 부모가 있는 댓글 입력
        ],
      ),
    );
  }
}
