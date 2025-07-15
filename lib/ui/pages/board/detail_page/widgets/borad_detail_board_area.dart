import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:flutter/material.dart';

class BoardDetailBoardArea extends StatelessWidget {
  final Board board;

  const BoardDetailBoardArea(this.board, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        // 게시글 이미지 영역
        Visibility(
          visible: true, // bool hasImg = true;
          child: SizedBox(
            height: screenWidth,
            width: screenWidth,
            child: PageView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Image.network(
                  "${board.imageString}",
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        // 게시글 작성자 + 제목 + 내용 + 좋아요 영역
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 작성자 프로필
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    backgroundImage: true // bool hasProfileImgUrl = true;
                        ? AssetImage('assets/images/lotte_emblem_sample.jpg')
                        : AssetImage('assets/images/user.png'),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 작성자 닉네임
                      MText.normal6_4('${board.nickname}', color: MColor.kLabel.normal),
                      // 작성자 응원팀 ( != 게시글 카테고리)
                      MText.normal7_4(board.myTeamName, color: MColor.kLabel.neutral),
                    ],
                  )
                ],
              ),
              SizedBox(height: 12),
              MText.normal5_6(board.title, color: MColor.kLabel.normal),
              SizedBox(height: 5),
              // 게시글 카테고리
              MText.normal7_4("${board.teamCategoryName}  •  ${board.relativeTime}", color: MColor.kLabel.neutral),
              SizedBox(height: 14),
              // 내용
              MText.normal6_5(board.content, color: MColor.kLabel.normal),
              SizedBox(height: 14),
              // 좋아요
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
                      MText.normal6_7('${board.likeCount}', color: MColor.kLabel.neutral)
                    ],
                  ),
                  SizedBox(width: 4),
                  // 댓글
                  Row(
                    children: [
                      MIcon.page.community.comment,
                      SizedBox(width: 4),
                      MText.normal6_7('4', color: MColor.kLabel.neutral),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
