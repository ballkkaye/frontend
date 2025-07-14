import 'package:ballkkaye_frontend/data/enum/game_status.dart';
import 'package:ballkkaye_frontend/data/model/team.dart';

class Game {
  final int? id;
  final Team homeTeam;
  final Team awayTeam;
  final String? gameDate;
  final String? gameTime;
  final String? stadiumName;
  final String? stadiumShortName;
  final GameStatus? gameStatus;
  final String? broadcastChannel;
  final String? ticketLink;
  final String? homePitcherName;
  final String? awayPitcherName;

  Game({
    this.id,
    required this.homeTeam,
    required this.awayTeam,
    this.gameStatus,
    this.gameDate,
    this.gameTime,
    this.stadiumName,
    this.stadiumShortName,
    this.broadcastChannel,
    this.ticketLink,
    this.homePitcherName,
    this.awayPitcherName,
  });

  Game.fromMap(Map<String, dynamic> map)
      : id = map['gameId'] ?? map['id'],
        homeTeam = map['homeTeam'] != null
            ? Team.fromMap(map['homeTeam'])
            : Team(
                teamId: map['homeTeamId'],
                fullName: map['homeTeamName'],
                teamLogo: map['homeTeamLogoUrl'],
              ),
        awayTeam = map['awayTeam'] != null
            ? Team.fromMap(map['awayTeam'])
            : Team(
                teamId: map['awayTeamId'],
                fullName: map['awayTeamName'],
                teamLogo: map['awayTeamLogoUrl'],
              ),
        gameDate = map['gameDate'],
        gameTime = map['gameTime'],
        stadiumName = map['stadiumName'],
        stadiumShortName = map['stadiumShortName'],
        gameStatus = GameStatusExtension.fromString(map['gameStatus']),
        broadcastChannel = map['broadcastChannel'],
        ticketLink = map['ticketLink'],
        homePitcherName = map['homePitcherName'],
        awayPitcherName = map['awayPitcherName'];

  Game.fromGameData(Map<String, dynamic> data)
      : id = data['gameId'],
        homeTeam = Team.fromGameData(
          teamId: data['homeTeamId'],
          fullName: data['homeTeamFullName'],
          score: data['homeTeamScore'] ?? 0,
        ),
        awayTeam = Team.fromGameData(
          teamId: data['awayTeamId'],
          fullName: data['awayTeamFullName'],
          score: data['awayTeamScore'] ?? 0,
        ),
        gameDate = data['gameDate'],
        stadiumName = data['stadiumFullName'],
        stadiumShortName = data['stadiumShortName'],
        gameTime = data['gameTime'],
        gameStatus = GameStatusExtension.fromString(data['gameStatus']),
        broadcastChannel = data['broadcastChannel'],
        ticketLink = data['ticketLink'],
        homePitcherName = data['homePitcherName'],
        awayPitcherName = data['awayPitcherName'];

  @override
  String toString() {
    return 'Game(id: $id, gameDate: $gameDate)';
  }
}
