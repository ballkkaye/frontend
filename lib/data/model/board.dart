// rule (copyWith, fromJson, toJson)
class BoardDetailItem {
  int boardId;
  String nickname;

  // String profileImgUrl;
  String relativeTime;
  String myTeamName;
  int teamCategoryId;
  String teamCategoryName;
  String title;
  String content;
  bool isOwner;
  bool isLike;
  int likeCount;

  // List<ReplyItem> replyItems;

  BoardDetailItem({
    required this.boardId,
    required this.nickname,
    // required this.profileImgUrl,
    required this.relativeTime,
    required this.myTeamName,
    required this.teamCategoryId,
    required this.teamCategoryName,
    required this.title,
    required this.content,
    required this.isOwner,
    required this.isLike,
    required this.likeCount,
    // required this.replyItems,
  });

  factory BoardDetailItem.fromMap(Map<String, dynamic> json) {
    return BoardDetailItem(
      boardId: json['boardId'],
      nickname: json['nickname'],
      // profileImgUrl: json['profileImageUrl'], //나중에 이미지넣을예정
      relativeTime: json['relativeTime'],
      myTeamName: json['myTeamName'],
      teamCategoryId: json['teamCategoryId'],
      teamCategoryName: json['teamCategoryName'],
      title: json['title'],
      content: json['content'],
      isOwner: json['isOwner'],
      isLike: json['isLike'],
      likeCount: json['likeCount'],
      // replyItems: (json['replyItems'] as List<dynamic>).map((e) => ReplyItem.fromJson(e)).toList(),
    );
  }
}
