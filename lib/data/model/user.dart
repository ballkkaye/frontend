class User {
  final int? id;
  final String? nickname;
  final String? birthDate;
  final String? ageRange;
  final String? gender;
  final String? profileUrl;
  final int? teamId;
  final String? accessToken;

  User({
    this.id,
    this.nickname,
    this.birthDate,
    this.ageRange,
    this.gender,
    this.profileUrl,
    this.teamId,
    this.accessToken,
  });

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      id: data['id'],
      nickname: data['nickname'],
      birthDate: data['birthDate'] ?? data['birth_date'],
      ageRange: data['ageRange'] ?? data['age_range'],
      gender: data['gender'],
      profileUrl: data['profileUrl'] ?? data['profile_url'],
      teamId: data['teamId'] ?? data['team_id'],
      accessToken: data['accessToken'],
    );
  }

  @override
  String toString() {
    return 'User(id: $id, nickname: $nickname, birthDate: $birthDate, ageRange: $ageRange, gender: $gender, profileUrl: $profileUrl, teamId: $teamId)';
  }
}
