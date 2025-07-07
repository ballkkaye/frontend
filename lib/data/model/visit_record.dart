class VisitRecord {
  int id;
  List<String>? imageString; //이미지 null일 수 있음
  String homeTeamName;
  String awayTeamName;
  int homeScore;
  int awayScore;
  String gameDate;
  String stadiumName;
  String result;
  String content;

  VisitRecord({
    this.imageString,
    required this.id,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeScore,
    required this.awayScore,
    required this.gameDate,
    required this.stadiumName,
    required this.result,
    required this.content,
  });

  factory VisitRecord.fromMap(Map<String, dynamic> data) {
    final imageList = data['imageString'] as List<dynamic>?;

    List<String>? imageUrls;
    if (imageList != null) {
      imageUrls = imageList.map((e) => e['imageUrl'] as String).toList();
    }

    return VisitRecord(
      id: data['id'],
      homeTeamName: data['homeTeamName'],
      awayTeamName: data['awayTeamName'],
      homeScore: data['homeScore'],
      awayScore: data['awayScore'],
      gameDate: data['gameDate'],
      stadiumName: data['stadiumName'],
      result: data['result'],
      content: data['content'],
      imageString: imageUrls,
    );
  }
}
