import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final BoardItem boardItem; // BoardItem 주입

  const ListCard({
    super.key,
    required this.boardItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/board/detail",
          arguments: boardItem.boardId,
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 작성자 + 시간
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    boardItem.nickname,
                    style: TextStyle(
                      color: MColor.kLabel.neutral,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    boardItem.relativeTime,
                    style: TextStyle(
                      color: MColor.kLabel.normal,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              // 게시글 제목
              Text(
                boardItem.title,
                style: TextStyle(
                  color: MColor.kLabel.normal,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              // 좋아요 + 댓글 수
              Row(
                children: [
                  // 좋아요
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // 좋아요 클릭 로직 추후 연결
                        },
                        borderRadius: BorderRadius.circular(80),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          child: MIcon.page.community.likedRed,
                        ),
                      ),
                      Text(
                        '${boardItem.likeCount}',
                        style: TextStyle(
                          color: MColor.kLabel.neutral,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 4),
                  // 댓글
                  Row(
                    children: [
                      MIcon.page.community.comment,
                      const SizedBox(width: 4),
                      Text(
                        '${boardItem.replyCount}',
                        style: TextStyle(
                          color: MColor.kLabel.neutral,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
