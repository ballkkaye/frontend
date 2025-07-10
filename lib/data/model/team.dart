class Team {
  final int? teamId;
  final String? teamName;
  final String? teamLogo;
  final int? teamRank;

  // Game 관련 속성
  final String? fullName;
  final String? shortName;
  final int? score;

  Team({
    this.teamId,
    this.teamName,
    this.teamLogo,
    this.teamRank,
    this.fullName,
    this.shortName,
    this.score,
  });

  Team.fromMap(Map<String, dynamic> data)
      : teamId = data['teamId'],
        teamName = data['teamName'],
        teamLogo = data['teamLogo'],
        teamRank = data['teamRank'],
        fullName = null,
        shortName = null,
        score = null;

  // Game 용도 팀 생성자 (fullName, shortName, score 기반)
  Team.fromGameData({
    required int teamId,
    required String fullName,
    String? shortName,
    required int score,
  })  : teamId = teamId,
        teamName = shortName,
        teamLogo = null,
        teamRank = null,
        fullName = fullName,
        shortName = shortName,
        score = score;

  Team copyWith({
    int? teamId,
    String? teamName,
    String? teamLogo,
    int? teamRank,
    String? fullName,
    String? shortName,
    int? score,
  }) {
    return Team(
      teamId: teamId ?? this.teamId,
      teamName: teamName ?? this.teamName,
      teamLogo: teamLogo ?? this.teamLogo,
      teamRank: teamRank ?? this.teamRank,
      fullName: fullName ?? this.fullName,
      shortName: shortName ?? this.shortName,
      score: score ?? this.score,
    );
  }

  String get label => fullName ?? teamName ?? '';

  @override
  String toString() {
    return 'Team(fullName: $fullName, shortName: $shortName, score: $score)';
  }
}
