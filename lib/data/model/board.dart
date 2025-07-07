// rule (copyWith, fromJson, toJson)

import 'package:ballkkaye_frontend/data/model/reply.dart';

class Board {
  final int boardId;
  final String nickname;

  //final String profileImgUrl;
  final String relativeTime;
  final String myTeamName;
  final int teamCategoryId;
  final String teamCategoryName;
  final String title;
  final String content;
  final bool isOwner;
  final bool isLike;
  final int likeCount;

  //final List<BoardImage> images;
  final List<Reply> replyItems;

  Board({
    required this.boardId,
    required this.nickname, //todo: 나중에 유저모델에서 받아서 사용
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

  factory Board.fromMap(Map<String, dynamic> data) {
    // 복합 데이터(replyItems) 파싱을 factory로 처리해서 가독성과 유지보수성을 높임
    return Board(
      boardId: data['boardId'],
      nickname: data['nickname'],
      // profileImgUrl: json['profileImageUrl'], //todo: 나중에 이미지추가할때 주석지워서 사용
      relativeTime: data['relativeTime'],
      myTeamName: data['myTeamName'],
      teamCategoryId: data['teamCategoryId'],
      teamCategoryName: data['teamCategoryName'],
      title: data['title'],
      content: data['content'],
      isOwner: data['isOwner'],
      isLike: data['isLike'],
      likeCount: data['likeCount'],
      // images: (json['images'] as List<dynamic>).map((e) => BoardImage.fromMap(e)).toList(), //todo: 나중에 이미지추가할때 주석지워서 사용
      replyItems: (data['replyItems'] as List<dynamic>?)?.map((e) => Reply.fromMap(e)).toList() ?? [],
    );
  }
}
