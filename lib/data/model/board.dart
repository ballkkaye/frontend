// rule (copyWith, fromJson, toJson)
import 'team.dart';

class Board {
  int boardId;
  String title;
  String nickname;
  String relativeTime;
  Team team;
  int likeCount;
  int replyCount;

  Board({
    required this.boardId,
    required this.title,
    required this.nickname,
    required this.relativeTime,
    required this.team,
    required this.likeCount,
    required this.replyCount,
  });

  factory Board.fromMap(Map<String, dynamic> data) {
    return Board(
      boardId: data['boardId'],
      title: data['title'],
      nickname: data['nickname'],
      relativeTime: data['relativeTime'],
      team: Team(
        teamId: data['teamId'],
        teamName: data['teamName'],
        teamLogo: '',
        teamRank: data['teamRank'] ?? 0,
      ),
      likeCount: data['likeCount'],
      replyCount: data['replyCount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'boardId': boardId,
      'title': title,
      'nickname': nickname,
      'relativeTime': relativeTime,
      'teamId': team.teamId,
      'teamName': team.teamName,
      'teamRank': team.teamRank,
      'likeCount': likeCount,
      'replyCount': replyCount,
    };
  }
}
