// rule (copyWith, fromJson, toJson)
import 'package:ballkkaye_frontend/data/model/reply.dart';

class Board {
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

  // List<BoardImage> images;
  List<ReplyItem> replyItems;

  Board({
    required this.boardId,
    required this.nickname,
    required this.relativeTime,
    required this.myTeamName,
    required this.teamCategoryId,
    required this.teamCategoryName,
    required this.title,
    required this.content,
    required this.isOwner,
    required this.isLike,
    required this.likeCount,
    // required this.images,
    required this.replyItems,
    // required this.profileImgUrl,
  });

  factory Board.fromMap(Map<String, dynamic> json) {
    return Board(
      boardId: json['boardId'],
      nickname: json['nickname'],
      // profileImgUrl: json['profileImageUrl'],
      relativeTime: json['relativeTime'],
      myTeamName: json['myTeamName'],
      teamCategoryId: json['teamCategoryId'],
      teamCategoryName: json['teamCategoryName'],
      title: json['title'],
      content: json['content'],
      isOwner: json['isOwner'],
      isLike: json['isLike'],
      likeCount: json['likeCount'],
      // images: (json['images'] as List<dynamic>).map((e) => BoardImage.fromMap(e)).toList(),
      replyItems: (json['replyItems'] as List<dynamic>).map((e) => ReplyItem.fromMap(e)).toList(),
    );
  }
}
