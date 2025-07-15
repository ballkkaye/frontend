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
  final String? teamName;

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
    this.teamName,
  });

  UserMatch.fromMap(Map<String, dynamic> data)
      : matchId = data['matchId'] ?? data['id'],
        isOwner = data['isOwner'],
        relativeTime = data['relativeTime'] ?? '방금 전',
        likeCount = data['likeCount'],
        isLike = data['isLike'],
        game = Game(
          homeTeam: Team(teamName: data['homeTeamName']),
          awayTeam: Team(teamName: data['awayTeamName']),
          gameDate: data['gameDate'],
          stadiumName: data['stadiumName'],
        ),
        user = User(
          nickname: data['userNickname'],
          teamName: data['userTeamName'] ?? '',
          profileUrl: data['userProfileUrl'],
        ),
        title = data['title'],
        content = data['content'],
        gender = data['gender'],
        age = data['age'],
        isSameTeam = data['isSameTeam'],
        participationInfo = data['participationInfo'],
        chatRoomId = data['chatRoomId'],
        teamId = data['teamId'],
        teamName = data['teamName'];

  UserMatch.fromWriteMap(Map<String, dynamic> data)
      : matchId = data['match']['id'],
        relativeTime = '방금 전',
        title = data['match']['title'],
        content = data['match']['content'],
        isSameTeam = data['chatRoom']['isSameTeam'],
        gender = data['chatRoom']['preferredGender'],
        age = data['chatRoom']['preferredAge'],
        teamName = data['chatRoom']['preferredTeamName'],
        participationInfo = "1/${data['chatRoom']['maxParticipants']}",
        chatRoomId = data['match']['chatRoomId'],
        teamId = null,
        isOwner = null,
        likeCount = null,
        isLike = null,
        game = Game(
          homeTeam: Team(teamName: data['chatRoom']['homeTeamName']),
          awayTeam: Team(teamName: data['chatRoom']['awayTeamName']),
          gameDate: null,
          stadiumName: null,
        ),
        user = User(
          nickname: data['match']['userNickname'],
          teamName: data['match']['userTeamName'],
          profileUrl: null,
        );

  @override
  String toString() {
    return 'UserMatch(title: $title, Game: $Game, User: $User)';
  }
}
