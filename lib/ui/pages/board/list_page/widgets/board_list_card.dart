import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:flutter/material.dart';

class BoardListCard extends StatelessWidget {
  final Board board;

  const BoardListCard({
    super.key,
    required this.board,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            "/board/detail",
            arguments: board.boardId,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: MColor.kShadow.normal,
            color: MColor.kBackground.normal,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 작성자 + 시간
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MText.normal5_6(board.nickname, color: MColor.kLabel.neutral),
                    MText.normal7_4(board.relativeTime, color: MColor.kLabel.normal),
                  ],
                ),
                SizedBox(height: 4),
                // 게시글 제목
                Text(
                  board.title,
                  style: TextStyle(
                    color: MColor.kLabel.normal,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 16),
                // 좋아요 + 댓글 수
                Row(
                  children: [
                    // 좋아요
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(80),
                          child: Padding(
                            padding: EdgeInsetsGeometry.directional(top: 4, bottom: 4, end: 4),
                            child: MIcon.page.community.likedRed,
                          ),
                        ),
                        MText.button4_5('${board.likeCount}', color: MColor.kLabel.neutral),
                      ],
                    ),
                    SizedBox(width: 4),
                    // 댓글
                    Row(
                      children: [
                        MIcon.page.community.comment,
                        SizedBox(width: 4),
                        MText.button4_5('${board.replyCount}', color: MColor.kLabel.neutral),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
