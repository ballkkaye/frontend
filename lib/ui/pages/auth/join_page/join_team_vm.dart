import 'package:ballkkaye_frontend/data/model/team.dart';
import 'package:ballkkaye_frontend/data/repository/team_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final joinTeamProvider = AutoDisposeNotifierProvider<JoinTeamVM, JoinTeamModel?>(() {
  return JoinTeamVM();
});

class JoinTeamVM extends AutoDisposeNotifier<JoinTeamModel?> {
  final mContext = navigatorKey.currentContext!;

  @override
  JoinTeamModel? build() {
    // 1. 상태 초기화
    init();

    // 2. VM 파괴되는지 확인하는 이벤트
    ref.onDispose(() {
      Logger().d("JoinTeamVM 파괴됨");
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

    state = JoinTeamModel.fromList(data['body']);
  }
}

// List 형태
class JoinTeamModel {
  List<Team> teams;

  JoinTeamModel(this.teams);

  JoinTeamModel.fromList(List<dynamic> list) : teams = list.map((e) => Team.fromMap(e)).toList();

  JoinTeamModel copyWith({
    List<Team>? teams,
  }) {
    return JoinTeamModel(
      teams ?? this.teams,
    );
  }

  @override
  String toString() {
    return 'JoinTeamModel{teams: $teams}';
  }
}
