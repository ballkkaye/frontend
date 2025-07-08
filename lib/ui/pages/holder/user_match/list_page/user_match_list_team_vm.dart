import 'package:ballkkaye_frontend/data/model/team.dart';
import 'package:ballkkaye_frontend/data/repository/team_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final userMatchListTeamProvider =
    AutoDisposeNotifierProvider<UserMatchListTeamVM, UserMatchListTeamModel?>(() {
  return UserMatchListTeamVM();
});

class UserMatchListTeamVM extends AutoDisposeNotifier<UserMatchListTeamModel?> {
  final mContext = navigatorKey.currentContext!;

  @override
  UserMatchListTeamModel? build() {
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

    state = UserMatchListTeamModel.fromList(data['body']);
  }
}

// List 형태
class UserMatchListTeamModel {
  List<Team> teams;

  UserMatchListTeamModel(this.teams);

  UserMatchListTeamModel.fromList(List<dynamic> list)
      : teams = list.map((e) => Team.fromMap(e)).toList();

  UserMatchListTeamModel copyWith({
    List<Team>? teams,
  }) {
    return UserMatchListTeamModel(
      teams ?? this.teams,
    );
  }

  @override
  String toString() {
    return 'JoinTeamModel{teams: $teams}';
  }
}
