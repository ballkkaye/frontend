import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/detail_reply_action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReplyItem extends StatelessWidget {
  final Map<String, dynamic> reply;
  final void Function(String mention)? onMention;

  const ReplyItem({
    super.key,
    required this.reply,
    this.onMention,
  });

  @override
  Widget build(BuildContext context) {
    bool isReply = reply['parentId'] != null;
    String author = reply['author'];
    String content = reply['content'];
    String time = reply['time'];
    int likeCount = reply['likeCount'] ?? 0;
    int replyCount = reply['replyCount'] ?? 0;
    bool isReplyOwner = reply['isReplyOwner'];
    bool hasProfileImgUrl = true;
    String profileImgUrl = 'assets/images/lotte_emblem_sample.jpg';

    return Padding(
      padding: EdgeInsets.only(
        top: 12,
        bottom: 0,
        right: 0,
        left: isReply ? 40 : 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 작성자 정보
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 프로필 이미지
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                backgroundImage: hasProfileImgUrl
                    ? AssetImage(profileImgUrl)
                    : const AssetImage('assets/images/user.png'),
              ),
              SizedBox(width: 8),
              // 응원 팀 및 작성 시간
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MText.label2_4(author, color: MColor.kLabel.normal),
                  Text(
                    "롯데 자이언츠  •  $time",
                    style: TextStyle(fontSize: 10, color: MColor.kLabel.neutral),
                  ),
                ],
              ),
              Spacer(),
              // 더보기 버튼
              Visibility(
                visible: isReplyOwner, // 로그인한 유저=댓글 주인인 경우에만 활성화됨
                child: InkWell(
                  onTap: () {
                    print('더보기 클릭됨: ${reply['id']}');
                    // TODO : actionSheet에 id 넘겨야 됨
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return DetailReplyActionSheet();
                      },
                    );
                  },
                  child: MIcon.nav.top.dotHorizontal,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // 댓글 내용
          MText.label1_5(content, color: MColor.kLabel.normal),
          SizedBox(height: 10),
          // 좋아요 + 대댓글 수 + 답글 달기
          Row(
            children: [
              // 좋아요
              InkWell(
                onTap: () {
                  print('좋아요 클릭됨: ${reply['id']}');
                  // TODO: 좋아요 로직
                },
                borderRadius: BorderRadius.circular(50),
                child: Row(
                  children: [
                    MIcon.page.community.likedRed,
                    SizedBox(width: 2),
                    MText.label2_5('$likeCount', color: MColor.kLabel.neutral),
                  ],
                ),
              ),
              SizedBox(width: 6),

              // 대댓글 수
              Row(
                children: [
                  MIcon.page.community.comment,
                  SizedBox(width: 2),
                  MText.label2_5('$replyCount', color: MColor.kLabel.neutral),
                ],
              ),
              SizedBox(width: 10),

              // 답글 달기
              TextButton(
                onPressed: () {
                  print('답글 달기 클릭됨: ${reply['id']}');
                  // TODO : 댓글 입력창에 @tagReplyName 자동 추가 author 대신 나중에 tagReplyName로 받기
                  //  TODO : 대댓글 입력시 필요한 부모 및 tag id 전달
                  if (onMention != null) {
                    onMention!('@${reply['author']} ');
                  }
                },
                style: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                  minimumSize: WidgetStateProperty.all<Size>(Size.zero),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  '답글 달기',
                  style: TextStyle(fontSize: 10, color: MColor.kLabel.neutral),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
