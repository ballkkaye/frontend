// rule (copyWith, fromJson, toJson)

import 'package:ballkkaye_frontend/data/model/board_image.dart';
import 'package:ballkkaye_frontend/data/model/reply.dart';

class Board {
  final int boardId;
  final String nickname;
  final String profileImgUrl;
  final String relativeTime;
  final String myTeamName;
  final int teamCategoryId;
  final String teamCategoryName;
  final String title;
  final String content;
  final bool isOwner;
  final bool isLike;
  final int likeCount;
  final int replyCount;
  final List<BoardImage> images;
  final List<Reply> replyItems;

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
    required this.replyCount,
    required this.images,
    required this.replyItems,
    required this.profileImgUrl,
  });

  static String _buildFullImageUrl(String? path) {
    if (path == null || path.isEmpty) {
      return ''; // 또는 'assets/images/default_image.png' (로컬 에셋)
    }
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return path;
    }
    return 'path'; // 상대 경로인 경우 Base URL과 조합
  }

  factory Board.fromMap(Map<String, dynamic> data) {
    // 복합 데이터(replyItems) 파싱을 factory로 처리해서 가독성과 유지보수성을 높임
    return Board(
      boardId: data['boardId'] as int,
      nickname: data['nickname'],
      profileImgUrl: _buildFullImageUrl(data['profileImg'] as String?),
      relativeTime: data['relativeTime'],
      myTeamName: data['myTeamName'] ?? '',
      teamCategoryId: data['teamCategoryId'] ?? 0,
      teamCategoryName: data['teamCategoryName'] ?? '',
      title: data['title'],
      content: data['content'] ?? '',
      isOwner: data['isOwner'] ?? false,
      isLike: data['isLike'] ?? false,
      likeCount: data['likeCount'],
      replyCount: data['replyCount'] ?? 0,
      images: (data['images'] as List<dynamic>?)?.map((e) => BoardImage.fromMap(e)).toList() ?? [],
      replyItems: (data['replyItems'] as List<dynamic>?)?.map((e) => Reply.fromMap(e)).toList() ?? [],
    );
  }

  /// 홈화면 전용 간단 파싱
  factory Board.fromSimple(Map<String, dynamic> data) {
    return Board(
      boardId: data['boardId'],
      nickname: '',
      relativeTime: '',
      myTeamName: '',
      teamCategoryId: 0,
      teamCategoryName: '',
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      isOwner: false,
      isLike: false,
      likeCount: 0,
      replyCount: 0,
      replyItems: [],
      profileImgUrl: '',
      images: [],
    );
  }

  Board copyWith({
    int? boardId,
    String? nickname,
    String? relativeTime,
    String? myTeamName,
    int? teamCategoryId,
    String? teamCategoryName,
    String? title,
    String? content,
    bool? isOwner,
    bool? isLike,
    int? likeCount,
    int? replyCount,
    String? imageString,
    String? profileImgUrl,
    List<Reply>? replyItems,
    List<BoardImage>? images,
  }) {
    return Board(
      boardId: boardId ?? this.boardId,
      nickname: nickname ?? this.nickname,
      relativeTime: relativeTime ?? this.relativeTime,
      myTeamName: myTeamName ?? this.myTeamName,
      teamCategoryId: teamCategoryId ?? this.teamCategoryId,
      teamCategoryName: teamCategoryName ?? this.teamCategoryName,
      title: title ?? this.title,
      content: content ?? this.content,
      isOwner: isOwner ?? this.isOwner,
      isLike: isLike ?? this.isLike,
      likeCount: likeCount ?? this.likeCount,
      replyCount: replyCount ?? this.replyCount,
      replyItems: replyItems ?? this.replyItems,
      profileImgUrl: profileImgUrl ?? this.profileImgUrl,
      images: images ?? this.images,
    );
  }
}
