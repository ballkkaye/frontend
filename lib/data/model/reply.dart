class Reply {
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
  final List<Reply> childReplies; // 대댓글

  Reply({
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

  factory Reply.fromMap(Map<String, dynamic> data) {
    //  factory: 복합 중첩 데이터(childReplies 등) 파싱 및 null 처리 위해서 사용
    return Reply(
      replyId: data['replyId'],
      nickname: data['nickname'],
      profileImg: data['profileImg'],
      relativeTime: data['relativeTime'],
      myTeamName: data['myTeamName'],
      content: data['content'],
      isOwner: data['isOwner'],
      isLike: data['isLike'],
      likeCount: data['likeCount'],
      parentReplyId: data['parentReplyId'],
      childReplies: (data['childReplies'] as List<dynamic>?) // null 허용
              ?.map((e) => Reply.fromMap(e)) // ReplyItem으로 변환
              .toList() ??
          [], // null이면 빈 배열로 변환
    );
  }
}
