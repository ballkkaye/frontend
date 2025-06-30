import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
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
                  Text('ssar',
                      style: TextStyle(
                          color: MColor.kLabel.neutral, fontSize: 14, fontWeight: FontWeight.w600)),
                  Text(
                    '15분전',
                    style: TextStyle(
                        color: MColor.kLabel.normal, fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 4),
              // 게시글 제목
              Text(
                '동행후기 써봄',
                style: TextStyle(
                    color: MColor.kLabel.normal, fontSize: 16, fontWeight: FontWeight.w600),
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
                      Text(
                        '20',
                        style: TextStyle(
                            color: MColor.kLabel.neutral,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(width: 4),
                  // 댓글
                  Row(
                    children: [
                      MIcon.page.community.comment,
                      SizedBox(width: 4),
                      Text(
                        '5',
                        style: TextStyle(
                            color: MColor.kLabel.neutral,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
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
