import 'package:ballkkaye_frontend/data/model/user_match.dart';
import 'package:ballkkaye_frontend/data/repository/user_match_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final userMatchListProvider = AutoDisposeNotifierProvider<UserMatchListVM, UserMatchListModel?>(() {
  return UserMatchListVM();
});

class UserMatchListVM extends AutoDisposeNotifier<UserMatchListModel?> {
  final mContext = navigatorKey.currentContext!;

  @override
  UserMatchListModel? build() {
    // 1. 상태 초기화
    init();

    // 2. VM 파괴되는지 확인하는 이벤트
    ref.onDispose(() {
      Logger().d("UserUpdateTeamVM 파괴됨");
    });

    // 3. 상태 값 세팅
    return null;
  }

  Future<void> init() async {
    Map<String, dynamic> data = await UserMatchRepository().getList();
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("팀 목록 통신 실패 : ${data["msg"]}")),
      );
      return;
    }

    state = UserMatchListModel.fromMap(data['body']);
  }
}

// List 형태
class UserMatchListModel {
  String? selectedGender;
  String? selectedAge;
  int? selectedTeamId;
  String? selectedTimeName;
  List<UserMatch> userMatches;

  UserMatchListModel(
    this.selectedGender,
    this.selectedAge,
    this.selectedTeamId,
    this.selectedTimeName,
    this.userMatches,
  );

  UserMatchListModel.fromMap(Map<String, dynamic> data)
      : selectedGender = data['selectedGender'],
        selectedAge = data['selectedAge'],
        selectedTeamId = data['selectedTeamId'],
        selectedTimeName = data['selectedTimeName'],
        userMatches = (data['matches'] as List).map((e) => UserMatch.fromMap(e)).toList();

  UserMatchListModel copyWith({
    String? selectedGender,
    String? selectedAge,
    int? selectedTeamId,
    String? selectedTimeName,
    List<UserMatch>? userMatches,
  }) {
    return UserMatchListModel(
      selectedGender ?? this.selectedGender,
      selectedAge ?? this.selectedAge,
      selectedTeamId ?? this.selectedTeamId,
      selectedTimeName ?? this.selectedTimeName,
      userMatches ?? this.userMatches,
    );
  }

  @override
  String toString() {
    return 'UserMatchListModel{selectedGender: $selectedGender, selectedAge: $selectedAge, selectedTeamId: $selectedTeamId, selectedTimeName: $selectedTimeName, userMatches: $userMatches}';
  }
}
