import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/detail_reply_action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReplyItem extends StatelessWidget {
  final Map<String, dynamic> reply;

  const ReplyItem({super.key, required this.reply});

  @override
  Widget build(BuildContext context) {
    final bool isReply = reply['parentId'] != null;
    final String author = reply['author'];
    final String content = reply['content'];
    final String time = reply['time'];
    final int likeCount = reply['likeCount'] ?? 0;
    final int replyCount = reply['replyCount'] ?? 0;
    final bool isReplyOwner = reply['isReplyOwner'];
    final bool hasProfileImgUrl = true;
    final String profileImgUrl = 'assets/images/lotte_emblem_sample.jpg';

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
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                backgroundImage: hasProfileImgUrl
                    ? AssetImage(profileImgUrl)
                    : const AssetImage('assets/images/user.png'),
              ),
              const SizedBox(width: 8),
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
              const Spacer(),
              // TODO : 로그인한 유저가 댓글 주인인 경우에만 버튼 활성화됨
              Visibility(
                visible: isReplyOwner,
                child: InkWell(
                  onTap: () {
                    print('더보기 클릭됨: ${reply['id']}');
                    // TODO : actionSheet에 id 넘겨야 됨
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return DetailActionSheet();
                      },
                    );
                  },
                  child: MIcon.nav.top.dotVertical,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // 댓글 내용
          MText.label1_5(content, color: MColor.kLabel.normal),

          const SizedBox(height: 10),

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
                    const SizedBox(width: 2),
                    MText.label2_5('$likeCount', color: MColor.kLabel.neutral),
                  ],
                ),
              ),
              const SizedBox(width: 6),

              // 대댓글 수
              InkWell(
                onTap: () {
                  print('답글 수 클릭됨: ${reply['id']}');
                  // TODO: 대댓글 펼치기 등
                },
                child: Row(
                  children: [
                    MIcon.page.community.comment,
                    const SizedBox(width: 2),
                    MText.label2_5('$replyCount', color: MColor.kLabel.neutral),
                  ],
                ),
              ),
              const SizedBox(width: 10),

              // 댓글 달기
              TextButton(
                onPressed: () {
                  print('댓글 달기 클릭됨: ${reply['id']}');
                  // TODO: 댓글 입력창 열기
                },
                style: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                  minimumSize: WidgetStateProperty.all<Size>(Size.zero),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  '댓글 달기',
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
