class VisitRecord {
  int id;
  String homeTeamName;
  String awayTeamName;
  int homeScore;
  int awayScore;
  String gameDate;
  String stadiumName;
  String result;
  String content;
  String? imageString; //이미지 null일 수 있음

  VisitRecord({
    required this.id,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeScore,
    required this.awayScore,
    required this.gameDate,
    required this.stadiumName,
    required this.result,
    required this.content,
    this.imageString,
  });

  VisitRecord.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        homeTeamName = data['homeTeamName'],
        awayTeamName = data['awayTeamName'],
        homeScore = data['homeScore'],
        awayScore = data['awayScore'],
        gameDate = data['gameDate'],
        stadiumName = data['stadiumName'],
        result = data['result'],
        content = data['content'],
        imageString = data['imageString'];
}
