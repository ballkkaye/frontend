import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/detail_action_sheet.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/reply_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoardDetailPage extends StatelessWidget {
  BoardDetailPage({super.key});

  bool isBoardOwner = true; // 게시글 주인 판별 -> 더보기 버튼
  int replyCount = 4; // 댓글 총 개수
  TextEditingController _replyController = TextEditingController();
  String mention = '';

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
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool hasImg = true;
    bool hasProfileImgUrl = true;

    return Scaffold(
      appBar: _appbar(context),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, "/board/update");
      //   },
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 이미지
            Visibility(
              visible: hasImg,
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
            // 게시글 영역
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
                        backgroundImage: hasProfileImgUrl
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
                          Text(
                            "롯데 자이언츠",
                            style: TextStyle(
                              fontSize: 12,
                              color: MColor.kLabel.neutral,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 12),
                  MText.h2('동행후기 써봄', color: MColor.kLabel.normal),
                  SizedBox(height: 5),
                  // 게시글 카테고리
                  Text(
                    "롯데 자이언츠  •  15분전",
                    style: TextStyle(
                      fontSize: 12,
                      color: MColor.kLabel.neutral,
                    ),
                  ),
                  SizedBox(height: 14),
                  // 내용
                  MText.label1_5(
                    '''오늘 처음으로 커뮤니티에서 만난 분과 직관을 다녀왔습니다. 
처음에는 조금 어색했지만, 야구 이야기로 금방 친해질 수 있었어요. 
같이 치킨도 먹고 응원가도 부르면서 정말 즐거운 시간을 보냈습니다. 
특히 7회말에 터진 역전 홈런은 평생 못 잊을 순간이었어요. 
같이 하이파이브도 하고 사진도 찍고, 진짜 가족같은 분위기였습니다. 
롯데 자이언츠 팬으로서 이런 동행이 더 많아졌으면 좋겠어요. 
중간에 비가 조금 왔지만 그마저도 추억이 되더라고요. 
다음에도 이런 기회가 있다면 꼭 참여하고 싶습니다. 
처음이라 걱정도 많았는데, 오히려 친구가 생긴 느낌이에요. 
모두들 좋은 사람과 좋은 직관 경험 하셨으면 좋겠습니다!''',
                    color: MColor.kLabel.normal,
                  )
                ],
              ),
            ),
            Divider(
              color: MColor.kLabel.disable,
              thickness: 10,
            ),
            // 댓글 영역
            Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MText.label1_5('댓글 ${replyCount}', color: MColor.kLabel.neutral),
                  ...replies.map((reply) => ReplyItem(
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
            ),
          ],
        ),
      ),
      // 댓글 입력창
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _replyController,
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "댓글을 입력하세요",
                  fillColor: MColor.kLabel.disable,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.arrow_up),
              color: MColor.kLabel.neutral,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      actions: [
        Visibility(
          visible: isBoardOwner,
          child: IconButton(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return DetailActionSheet();
                },
              );
            },
            icon: MIcon.nav.top.dotHorizontal,
          ),
        ),
      ],
    );
  }
}
