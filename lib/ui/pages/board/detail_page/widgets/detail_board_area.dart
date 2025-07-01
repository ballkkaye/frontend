import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class DetailBoardArea extends StatelessWidget {
  const DetailBoardArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    String content = '''
오늘 처음으로 커뮤니티에서 만난 분과 직관을 다녀왔습니다. 
처음에는 조금 어색했지만, 야구 이야기로 금방 친해질 수 있었어요. 
같이 치킨도 먹고 응원가도 부르면서 정말 즐거운 시간을 보냈습니다. 
특히 7회말에 터진 역전 홈런은 평생 못 잊을 순간이었어요. 
같이 하이파이브도 하고 사진도 찍고, 진짜 가족같은 분위기였습니다. 
롯데 자이언츠 팬으로서 이런 동행이 더 많아졌으면 좋겠어요. 
중간에 비가 조금 왔지만 그마저도 추억이 되더라고요. 
다음에도 이런 기회가 있다면 꼭 참여하고 싶습니다. 
처음이라 걱정도 많았는데, 오히려 친구가 생긴 느낌이에요. 
모두들 좋은 사람과 좋은 직관 경험 하셨으면 좋겠습니다!''';

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
                return Image.asset(
                  "assets/images/visit_record_sample.jpg",
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
                      MText.label1_6('ssar', color: MColor.kLabel.normal),
                      // 작성자 응원팀 ( != 게시글 카테고리)
                      MText.label2_4("롯데 자이언츠", color: MColor.kLabel.neutral),
                    ],
                  )
                ],
              ),
              SizedBox(height: 12),
              MText.h2('동행후기 써봄', color: MColor.kLabel.normal),
              SizedBox(height: 5),
              // 게시글 카테고리
              MText.label2_4(
                "롯데 자이언츠  •  15분전",
                color: MColor.kLabel.neutral,
              ),
              SizedBox(height: 14),
              // 내용
              MText.label1_5(
                content,
                color: MColor.kLabel.normal,
              ),
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
                          padding: EdgeInsetsGeometry.directional(
                              top: 4, bottom: 4, end: 4),
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
                        '4',
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
      ],
    );
  }
}
