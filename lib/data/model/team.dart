class Team {
  final int? id;
  final String? name;
  final String? teamLogo;
  final int? teamRank;

  Team({
    this.id,
    this.name,
    this.teamLogo,
    this.teamRank,
  });

  factory Team.fromMap(Map<String, dynamic> data) {
    return Team(
      id: data['teamId'] ?? 0,
      name: data['teamName'] ?? '',
      teamLogo: data['teamLogo'],
      teamRank: data['teamRank'] ?? 0,
    );
  }

  Team copyWith({
    int? teamId,
    String? name,
    String? teamLogo,
    int? teamRank,
  }) {
    return Team(
      id: teamId ?? this.id,
      name: name ?? this.name,
      teamLogo: teamLogo ?? this.teamLogo,
      teamRank: teamRank ?? this.teamRank,
    );
  }

  String get label => name ?? '';

  @override
  String toString() {
    return 'Team(teamId: $id, teamName: $name, teamLogo: $teamLogo, teamRank: $teamRank)';
  }
}
