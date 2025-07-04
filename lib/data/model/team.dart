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

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      teamId: json['teamId'],
      teamName: json['teamName'],
      teamLogo: json['teamLogo'],
      teamRank: json['teamRank'],
    );
  }

  Map<String, dynamic> toJson() {
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
