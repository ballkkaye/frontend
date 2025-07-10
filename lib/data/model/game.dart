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
                id: map['homeTeamId'],
                name: map['homeTeamName'],
                teamLogo: map['homeTeamLogoUrl'],
              ),
        awayTeam = map['awayTeam'] != null
            ? Team.fromMap(map['awayTeam'])
            : Team(
                id: map['awayTeamId'],
                name: map['awayTeamName'],
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

  Game copyWith({
    int? id,
    Team? homeTeam,
    Team? awayTeam,
    String? gameDate,
    GameStatus? gameStatus,
    String? stadiumName,
    String? stadiumShortName,
    String? broadcastChannel,
    String? homePitcherName,
    String? awayPitcherName,
    String? ticketLink,
    String? gameTime,
  }) {
    return Game(
      id: id ?? this.id,
      homeTeam: homeTeam ?? this.homeTeam,
      awayTeam: awayTeam ?? this.awayTeam,
      gameDate: gameDate ?? this.gameDate,
      gameStatus: gameStatus ?? this.gameStatus,
      stadiumName: stadiumName ?? this.stadiumName,
      stadiumShortName: stadiumShortName ?? this.stadiumShortName,
      broadcastChannel: broadcastChannel ?? this.broadcastChannel,
      homePitcherName: homePitcherName ?? this.homePitcherName,
      awayPitcherName: awayPitcherName ?? this.awayPitcherName,
      ticketLink: ticketLink ?? this.ticketLink,
      gameTime: gameTime ?? this.gameTime,
    );
  }

  @override
  String toString() {
    return 'Game(id: $id, gameDate: $gameDate)';
  }
}
