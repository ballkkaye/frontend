class User {
  final int? id;
  final String? nickname;
  final String? birthDate;
  final String? ageRange;
  final String? gender;
  final String? profileUrl;
  final int? teamId;
  final String? teamName;
  final String? accessToken;

  final String? username;
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? providerType;
  final String? userRole;
  final bool? isNewUser;

  User({
    this.id,
    this.nickname,
    this.birthDate,
    this.ageRange,
    this.gender,
    this.profileUrl,
    this.teamId,
    this.teamName,
    this.accessToken,
    this.username,
    this.name,
    this.phoneNumber,
    this.email,
    this.providerType,
    this.userRole,
    this.isNewUser,
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
        accessToken = data['accessToken'],
        username = data['username'],
        name = data['name'],
        phoneNumber = data['phoneNumber'],
        email = data['email'],
        providerType = data['providerType'],
        userRole = data['userRole'],
        isNewUser = data['isNewUser'];

  @override
  String toString() {
    return 'User(id: $id, nickname: $nickname, birthDate: $birthDate, ageRange: $ageRange, gender: $gender, profileUrl: $profileUrl, teamId: $teamId, teamName: $teamName, accessToken: $accessToken, username: $username, name: $name, phoneNumber: $phoneNumber, email: $email, providerType: $providerType, userRole: $userRole)';
  }
}
