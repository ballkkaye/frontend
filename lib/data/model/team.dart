class Team {
  final int? id;
  final String? name;

  Team({
    this.id,
    this.name,
  });

  Team.fromMap(Map<String, dynamic> data)
      : id = data['teamId'],
        name = data['teamName'];

  String get label => name ?? '';

  @override
  String toString() {
    return 'Team(id: $id, name: $name)';
  }
}
