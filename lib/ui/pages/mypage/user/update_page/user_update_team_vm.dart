import 'package:ballkkaye_frontend/data/model/team.dart';
import 'package:ballkkaye_frontend/data/repository/team_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final userUpdateTeamProvider =
    AutoDisposeNotifierProvider<UserUpdateTeamVM, UserUpdateTeamModel?>(() {
  return UserUpdateTeamVM();
});

class UserUpdateTeamVM extends AutoDisposeNotifier<UserUpdateTeamModel?> {
  final mContext = navigatorKey.currentContext!;

  @override
  UserUpdateTeamModel? build() {
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
    Map<String, dynamic> data = await TeamRepository().getList();
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("팀 목록 통신 실패 : ${data["msg"]}")),
      );
      return;
    }

    state = UserUpdateTeamModel.fromList(data['body']);
  }
}

// List 형태
class UserUpdateTeamModel {
  List<Team> teams;

  UserUpdateTeamModel(this.teams);

  UserUpdateTeamModel.fromList(List<dynamic> list)
      : teams = list.map((e) => Team.fromMap(e)).toList();

  UserUpdateTeamModel copyWith({
    List<Team>? teams,
  }) {
    return UserUpdateTeamModel(
      teams ?? this.teams,
    );
  }

  @override
  String toString() {
    return 'UserUpdateTeamModel{teams: $teams}';
  }
}
