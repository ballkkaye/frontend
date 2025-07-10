import 'package:ballkkaye_frontend/data/model/team.dart';

class Game {
  final int? id;
  final Team homeTeam;
  final Team awayTeam;
  final String? gameDate;
  final String? gameTime;
  final String? stadiumName;
  final String? gameStatus;
  final String? broadcastChannel;
  final String? ticketLink;
  final String? homePitcherName;
  final String? awayPitcherName;

  Game({
    this.id,
    required this.homeTeam,
    required this.awayTeam,
    this.gameDate,
    this.gameTime,
    this.stadiumName,
    this.gameStatus,
    this.broadcastChannel,
    this.ticketLink,
    this.homePitcherName,
    this.awayPitcherName,
  });

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      id: map['gameId'] ?? map['id'],
      homeTeam: map['homeTeam'] != null
          ? Team.fromMap(map['homeTeam'])
          : Team(
              id: -1,
              name: '',
              teamLogo: map['homeTeamLogoUrl'] ?? '',
            ),
      awayTeam: map['awayTeam'] != null
          ? Team.fromMap(map['awayTeam'])
          : Team(
              id: -1,
              name: '',
              teamLogo: map['awayTeamLogoUrl'] ?? '',
            ),
      gameDate: map['gameDate'],
      gameTime: map['gameTime'],
      stadiumName: map['stadiumName'],
      gameStatus: map['gameStatus'],
      broadcastChannel: map['broadcastChannel'],
      ticketLink: map['ticketLink'],
      homePitcherName: map['homePitcherName'],
      awayPitcherName: map['awayPitcherName'],
    );
  }

  @override
  String toString() {
    return 'Game(id: $id, gameDate: $gameDate)';
  }
}
