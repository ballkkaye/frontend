import 'package:ballkkaye_frontend/data/model/user.dart';

class VisitRecord {
  int? id;
  int? gameId;
  String? imageString; //이미지 null일 수 있음
  String homeTeamName;
  String awayTeamName;
  String? homeTeamFullName;
  String? awayTeamFullName;
  int homeScore;
  int awayScore;
  String gameDate;
  String stadiumName;
  String? stadiumShortName;
  String? result;
  String? content;
  String? imgUrl;
  String? deleteStatus;
  String? selectedDate;
  User? user;
  int? teamId;

  VisitRecord({
    this.id,
    this.gameId,
    this.imageString,
    required this.homeTeamName,
    required this.awayTeamName,
    this.homeTeamFullName,
    this.awayTeamFullName,
    required this.homeScore,
    required this.awayScore,
    required this.gameDate,
    required this.stadiumName,
    required this.stadiumShortName,
    this.result,
    this.content,
    this.imgUrl,
    this.deleteStatus,
    this.selectedDate,
    this.user,
    this.teamId,
  });

  String get gameName =>
      '$awayTeamFullName vs $homeTeamFullName ($stadiumShortName)';

  factory VisitRecord.fromMap(Map<String, dynamic> data) {
    return VisitRecord(
      id: data['id'] ?? 0,
      gameId: data['gameId'] ?? 0,
      imageString: data['imageString'] ?? '',
      homeTeamName: data['homeTeamName'] ?? data['homeTeamShortName'] ?? '',
      awayTeamName: data['awayTeamName'] ?? data['awayTeamShortName'] ?? '',
      homeTeamFullName: data['homeTeamFullName'] ?? '',
      awayTeamFullName: data['awayTeamFullName'] ?? '',
      homeScore: data['homeScore'] ?? data['homeTeamScore'] ?? 0,
      awayScore: data['awayScore'] ?? data['awayTeamScore'] ?? 0,
      gameDate: data['gameDate'] ?? '',
      stadiumName: data['stadiumName'] ?? '',
      stadiumShortName: data['stadiumShortName'] ?? '',
      result: data['result'] ?? '',
      content: data['content'] ?? '',
      imgUrl: data['imgUrl'] ?? '',
      deleteStatus: data['deleteStatus'] ?? '',
      selectedDate: data['selectedDate'] ?? '',
      user: User(
        teamId: data['teamId'],
      ),
    );
  }
}
