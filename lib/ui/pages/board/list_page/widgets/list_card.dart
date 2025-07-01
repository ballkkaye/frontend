import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/board/detail");
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
                  MText.label1_5('ssar', color: MColor.kLabel.neutral),
                  MText.label2_5('15분전', color: MColor.kLabel.normal),
                ],
              ),
              SizedBox(height: 4),
              // 게시글 제목
              MText.label1_5(
                '동행후기 써봄',
                color: MColor.kLabel.normal,
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
                          padding: EdgeInsetsGeometry.directional(
                              top: 4, bottom: 4, end: 4),
                          child: MIcon.page.community.likedRed,
                        ),
                      ),
                      MText.label1_5('20', color: MColor.kLabel.neutral)
                    ],
                  ),
                  SizedBox(width: 4),
                  // 댓글
                  Row(
                    children: [
                      MIcon.page.community.comment,
                      SizedBox(width: 4),
                      MText.label1_5('5', color: MColor.kLabel.neutral)
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
