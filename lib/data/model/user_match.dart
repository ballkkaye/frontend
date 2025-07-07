import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/data/model/team.dart';
import 'package:ballkkaye_frontend/data/model/user.dart';

class UserMatch {
  final bool isOwner;
  final String relativeTime;
  final int likeCount;
  final bool isLike;
  final Game game;
  final User user;
  final String title;
  final String content;
  final String gender;
  final String age;
  final bool isSameTeam;
  final String participationInfo;
  final int chatRoomId;

  UserMatch({
    required this.isOwner,
    required this.relativeTime,
    required this.likeCount,
    required this.isLike,
    required this.game,
    required this.user,
    required this.title,
    required this.content,
    required this.gender,
    required this.age,
    required this.isSameTeam,
    required this.participationInfo,
    required this.chatRoomId,
  });

  UserMatch.fromMap(Map<String, dynamic> data)
      : isOwner = data['isOwner'],
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
        chatRoomId = data['chatRoomId'];

  @override
  String toString() {
    return 'UserMatch(title: $title, Game: $Game, User: $User)';
  }
}
