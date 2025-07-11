import 'package:ballkkaye_frontend/data/model/team.dart';

class Game {
  final int? id;
  final Team homeTeam;
  final Team awayTeam;
  final String? gameDate;
  final String? stadiumName;
  final String? stadiumShortName;

  Game({
    this.id,
    required this.homeTeam,
    required this.awayTeam,
    required this.gameDate,
    this.stadiumName,
    this.stadiumShortName,
  });

  Game.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        homeTeam = Team.fromMap(data['homeTeam']),
        awayTeam = Team.fromMap(data['awayTeam']),
        gameDate = data['gameDate'],
        stadiumName = data['stadiumName'],
        stadiumShortName = null;

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
        stadiumShortName = data['stadiumShortName'];

  @override
  String toString() {
    return 'Game(id: $id, gameDate: $gameDate)';
  }
}
