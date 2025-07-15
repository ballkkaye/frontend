import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/reply.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_more_option_btn.dart';
import 'package:flutter/material.dart';

class BoardDetailReplyItem extends StatelessWidget {
  final Reply reply;
  final void Function(String mention)? onMention;

  const BoardDetailReplyItem({
    super.key,
    required this.reply,
    this.onMention,
  });

  @override
  Widget build(BuildContext context) {
    bool hasProfileImgUrl =
        reply.profileImg != null && reply.profileImg.isNotEmpty && reply.profileImg.startsWith('http');

    return Padding(
      padding: EdgeInsets.only(
        top: 12,
        bottom: 0,
        right: 0,
        left: reply.parentReplyId != null ? 40 : 0,
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
                child: ClipOval(
                  child: hasProfileImgUrl
                      ? Image.network(
                          reply.profileImg,
                          fit: BoxFit.cover,
                          width: 40,
                          height: 40,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/user.png',
                              fit: BoxFit.cover,
                              width: 40,
                              height: 40,
                            );
                          },
                        )
                      : Image.asset(
                          'assets/images/user.png',
                          fit: BoxFit.cover,
                          width: 40,
                          height: 40,
                        ),
                ),
              ),
              SizedBox(width: 8),
              // 응원 팀 및 작성 시간
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MText.normal6_4(reply.nickname, color: MColor.kLabel.normal),
                  MText.normal7_4("${reply.myTeamName}  •  ${reply.relativeTime}", color: MColor.kLabel.neutral),
                ],
              ),
              Spacer(),
              // 더보기 버튼
              Visibility(
                visible: reply.isOwner, // 로그인한 유저=댓글 주인인 경우에만 활성화됨
                child: MMoreOptionBtn(
                  icon: MIcon.nav.top.dotHorizontal,
                  onUpdate: () {},
                  // TODO : 댓글 수정 -> 입력창에 댓글 기존 내용 불러오기
                  alertTitle: '댓글 삭제',
                  alertContent: '댓글을 삭제하시겠습니까?',
                  onAlertConfirm: () {},
                  // 다이얼로그 닫힌 뒤 동작
                  onAlertCancel: () {},
                  // 다이얼로그 닫힌 뒤 동작
                  alertConfirmText: '삭제',
                  alertCancelText: '취소',
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // 댓글 내용
          MText.normal6_5(reply.content, color: MColor.kLabel.normal),
          SizedBox(height: 10),
          // 좋아요 + 대댓글 수 + 답글 달기
          Row(
            children: [
              // 좋아요
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      print('좋아요 클릭됨: ${reply.replyId}');
                      // TODO: 좋아요 로직
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Padding(
                      padding: EdgeInsetsGeometry.directional(top: 4, bottom: 4, end: 4),
                      child: MIcon.page.community.likedRed,
                    ),
                  ),
                  MText.normal7_6('${reply.likeCount}', color: MColor.kLabel.neutral),
                ],
              ),
              SizedBox(width: 6),
              // 댓글
              Row(
                children: [
                  MIcon.page.community.comment,
                  SizedBox(width: 2),
                  MText.normal7_6('${reply.childReplies.length}', color: MColor.kLabel.neutral),
                ],
              ),
              SizedBox(width: 10),
              // 답글 달기
              TextButton(
                onPressed: () {
                  print('답글 달기 클릭됨: ${reply.replyId}');
                  // TODO : 댓글 입력창에 @tagReplyName 자동 추가 author 대신 나중에 tagReplyName로 받기
                  //  TODO : 대댓글 입력시 필요한 부모 및 tag id 전달
                  if (onMention != null) {
                    onMention!('@${reply.replyId} ');
                  }
                },
                style: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                  minimumSize: WidgetStateProperty.all<Size>(Size.zero),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: MText.normal7_4('답글 달기', color: MColor.kLabel.neutral),
              ),
            ],
          ),
          if (reply.childReplies != null && reply.childReplies!.isNotEmpty)
            Column(
              children: reply.childReplies!
                  .map(
                    (child) => BoardDetailReplyItem(
                      reply: child,
                      onMention: onMention,
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}
