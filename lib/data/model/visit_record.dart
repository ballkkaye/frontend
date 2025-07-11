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
  });

  String get gameName =>
      '$awayTeamFullName vs $homeTeamFullName ($stadiumShortName)';

  factory VisitRecord.fromMap(Map<String, dynamic> data) {
    // print('✅ fromMap data: $data');
    //
    // print("✅ id type: ${data['id'].runtimeType}");
    // print("✅ gameId type: ${data['gameId'].runtimeType}");
    // print("✅ imageString type: ${data['imageString'].runtimeType}");
    // print("✅ homeTeamName type: ${data['homeTeamName'].runtimeType}");
    // print("✅ awayTeamName type: ${data['awayTeamName'].runtimeType}");
    // print("✅ homeScore type: ${data['homeScore'].runtimeType}");
    // print("✅ awayScore type: ${data['awayScore'].runtimeType}");
    // print("✅ gameDate type: ${data['gameDate'].runtimeType}");
    // print("✅ stadiumName type: ${data['stadiumName'].runtimeType}");
    // print("✅ result type: ${data['result'].runtimeType}");
    // print("✅ content type: ${data['content'].runtimeType}");
    // print("✅ imgUrl type: ${data['imgUrl'].runtimeType}");
    // print("✅ deleteStatus type: ${data['deleteStatus'].runtimeType}");
    // print("✅ selectedDate type: ${data['selectedDate'].runtimeType}");
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
    );
  }
}
