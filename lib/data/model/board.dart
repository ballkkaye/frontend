class Board {
  final int boardId;
  final String? nickname; // user
  // final String? profileImageUrl; // user
  final String? myTeamName; // user
  // final User user;
  final String? relativeTime;
  final int? teamCategoryId;
  final String? teamCategoryName;
  final String title;
  final String content;
  final bool? isOwner;
  final bool? isLike;
  final int? likeCount;
  // TODO: 이미지 필드 추가 필요

  Board({
    required this.boardId,
    required this.nickname,
    // required this.profileImageUrl,
    required this.myTeamName,
    // required this.user,
    required this.relativeTime,
    required this.teamCategoryId,
    required this.teamCategoryName,
    required this.title,
    required this.content,
    required this.isOwner,
    required this.isLike,
    required this.likeCount,
  });

  Board.fromMap(Map<String, dynamic> data)
      : boardId = data['boardId'],
        nickname = data['nickname'],
        // profileImageUrl = data['profileImageUrl'],
        myTeamName = data['myTeamName'],
        //       user = User(
        //         nickname: data['userNickname'],
        //         teamName: data['myTeamName'],
        //         profileUrl: data['profileImageUrl'],
        //       ),
        relativeTime = data['relativeTime'],
        teamCategoryId = data['teamCategoryId'],
        teamCategoryName = data['teamCategoryName'],
        title = data['title'],
        content = data['content'],
        isOwner = data['isOwner'],
        isLike = data['isLike'],
        likeCount = data['likeCount'];

  @override
  String toString() {
    return 'Board(boardId: $boardId, title: $title, likeCount: $likeCount)';
  }
}
