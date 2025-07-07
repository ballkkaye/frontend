class ReplyItem {
  final int replyId;
  final String nickname;
  final String profileImg;
  final String relativeTime;
  final String myTeamName;
  final String content;
  final bool isOwner;
  final bool isLike;
  final int likeCount;
  final int? parentReplyId;
  final List<ReplyItem> childReplies; // 대댓글

  ReplyItem({
    required this.replyId,
    required this.nickname,
    required this.profileImg,
    required this.relativeTime,
    required this.myTeamName,
    required this.content,
    required this.isOwner,
    required this.isLike,
    required this.likeCount,
    required this.childReplies,
    required this.parentReplyId,
  });

  factory ReplyItem.fromMap(Map<String, dynamic> json) {
    //  factory: 복합 중첩 데이터(childReplies 등) 파싱을 위해 사용
    return ReplyItem(
      replyId: json['replyId'],
      nickname: json['nickname'],
      profileImg: json['profileImg'],
      relativeTime: json['relativeTime'],
      myTeamName: json['myTeamName'],
      content: json['content'],
      isOwner: json['isOwner'],
      isLike: json['isLike'],
      likeCount: json['likeCount'],
      parentReplyId: json['parentReplyId'],
      childReplies: (json['childReplies'] as List<dynamic>?) // null 허용
              ?.map((e) => ReplyItem.fromMap(e)) // ReplyItem으로 변환
              .toList() ??
          [], // null이면 빈 배열로 변환
    );
  }
}
