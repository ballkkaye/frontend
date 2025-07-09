import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/data/model/team.dart';
import 'package:ballkkaye_frontend/data/model/user.dart';

class UserMatch {
  final int? matchId;
  final bool? isOwner;
  final String? relativeTime;
  final int? likeCount;
  final bool? isLike;
  final Game game;
  final User user;
  final String title;
  final String? content;
  final String? gender;
  final String? age;
  final bool? isSameTeam;
  final String? participationInfo;
  final int? chatRoomId;
  final int? teamId;

  UserMatch({
    this.matchId,
    this.isOwner,
    this.relativeTime,
    this.likeCount,
    this.isLike,
    required this.game,
    required this.user,
    required this.title,
    this.content,
    this.gender,
    this.age,
    this.isSameTeam,
    this.participationInfo,
    this.chatRoomId,
    this.teamId,
  });

  UserMatch.fromMap(Map<String, dynamic> data)
      : matchId = data['matchId'],
        isOwner = data['isOwner'],
        relativeTime = data['relativeTime'],
        likeCount = data['likeCount'],
        isLike = data['isLike'],
        game = Game(
          homeTeam: Team(name: data['homeTeamName']),
          awayTeam: Team(name: data['awayTeamName']),
          gameDate: data['gameDate'],
          stadiumName: data['stadiumName'],
        ),
        user = User(
          nickname: data['userNickname'],
          teamName: data['userTeamName'],
          profileUrl: data['userProfileUrl'],
        ),
        title = data['title'],
        content = data['content'],
        gender = data['gender'],
        age = data['age'],
        isSameTeam = data['isSameTeam'],
        participationInfo = data['participationInfo'],
        chatRoomId = data['chatRoomId'],
        teamId = data['teamId'];

  @override
  String toString() {
    return 'UserMatch(title: $title, Game: $Game, User: $User)';
  }
}
