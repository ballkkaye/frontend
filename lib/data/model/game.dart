import 'package:ballkkaye_frontend/data/model/team.dart';

class Game {
  final int? id;
  final Team homeTeam;
  final Team awayTeam;
  final String? gameDate;
  final String? stadiumName;

  Game({
    this.id,
    required this.homeTeam,
    required this.awayTeam,
    required this.gameDate,
    this.stadiumName,
  });

  Game.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        homeTeam = Team.fromMap(data['homeTeam']),
        awayTeam = Team.fromMap(data['awayTeam']),
        gameDate = data['gameDate'],
        stadiumName = data['stadiumName'];

  @override
  String toString() {
    return 'Game(id: $id, gameDate: $gameDate)';
  }
}
