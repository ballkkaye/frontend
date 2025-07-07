class Team {
  int teamId;
  String teamName;
  String teamLogo;
  int teamRank;

  Team({
    required this.teamId,
    required this.teamName,
    required this.teamLogo,
    required this.teamRank,
  });

  factory Team.fromMap(Map<String, dynamic> data) {
    return Team(
      teamId: data['teamId'],
      teamName: data['teamName'],
      teamLogo: data['teamLogo'],
      teamRank: data['teamRank'],
    );
  }

  Map<String, dynamic> fromMap() {
    return {
      'teamId': teamId,
      'teamName': teamName,
      'teamLogo': teamLogo,
      'teamRank': teamRank,
    };
  }

  Team copyWith({
    int? teamId,
    String? teamName,
    String? teamLogo,
    int? teamRank,
  }) {
    return Team(
      teamId: teamId ?? this.teamId,
      teamName: teamName ?? this.teamName,
      teamLogo: teamLogo ?? this.teamLogo,
      teamRank: teamRank ?? this.teamRank,
    );
  }
}
