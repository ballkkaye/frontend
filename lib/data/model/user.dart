class User {
  final int? id;
  final String nickname;
  final String? birthDate;
  final String? ageRange;
  final String? gender;
  final String? profileUrl;
  final int? teamId;
  final String teamName;
  final String? accessToken;

  User({
    this.id,
    required this.nickname,
    this.birthDate,
    this.ageRange,
    this.gender,
    this.profileUrl,
    this.teamId,
    required this.teamName,
    this.accessToken,
  });

  User.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        nickname = data['nickname'],
        birthDate = data['birthDate'],
        ageRange = data['ageRange'],
        gender = data['gender'],
        profileUrl = data['profileUrl'],
        teamId = data['teamId'],
        teamName = data['teamName'],
        accessToken = data['accessToken'];

  @override
  String toString() {
    return 'User(id: $id, nickname: $nickname, birthDate: $birthDate, ageRange: $ageRange, gender: $gender, profileUrl: $profileUrl, teamId: $teamId)';
  }
}
