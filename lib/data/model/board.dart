// rule (copyWith, fromJson, toJson)
import 'team.dart';

class BoardItem {
  int boardId;
  String title;
  String nickname;
  String relativeTime;
  Team team;
  int likeCount;
  int replyCount;

  BoardItem({
    required this.boardId,
    required this.title,
    required this.nickname,
    required this.relativeTime,
    required this.team,
    required this.likeCount,
    required this.replyCount,
  });

  factory BoardItem.fromJson(Map<String, dynamic> json) {
    return BoardItem(
      boardId: json['boardId'],
      title: json['title'],
      nickname: json['nickname'],
      relativeTime: json['relativeTime'],
      team: Team(
        teamId: json['teamId'],
        teamName: json['teamName'],
        teamLogo: '', //
        teamRank: 0, //
      ),
      likeCount: json['likeCount'],
      replyCount: json['replyCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'boardId': boardId,
      'title': title,
      'nickname': nickname,
      'relativeTime': relativeTime,
      'teamId': team.teamId,
      'teamName': team.teamName,
      'likeCount': likeCount,
      'replyCount': replyCount,
    };
  }
}
