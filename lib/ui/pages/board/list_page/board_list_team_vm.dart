import 'package:ballkkaye_frontend/data/model/team.dart';
import 'package:ballkkaye_frontend/data/repository/team_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final boardListTeamProvider = AutoDisposeNotifierProvider<BoardListTeamVM, BoardListTeamModel?>(
  () => BoardListTeamVM(),
);

class BoardListTeamVM extends AutoDisposeNotifier<BoardListTeamModel?> {
  final mContext = navigatorKey.currentContext!;

  @override
  BoardListTeamModel? build() {
    init();
    return null;
  }

  Future<void> init() async {
    final data = await TeamRepository().getList();
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("팀 목록 불러오기 실패 : ${data["msg"]}")),
      );
      return;
    }

    final List teams = data['body'];

    state = BoardListTeamModel(
      teams.map((e) => Team.fromMap(e)).toList(),
    );
  }
}

class BoardListTeamModel {
  final List<Team> teams;

  BoardListTeamModel(this.teams);

  factory BoardListTeamModel.fromMap(Map<String, dynamic> data) {
    return BoardListTeamModel(
      (data['teams'] as List<dynamic>).map((e) => Team.fromMap(e)).toList(),
    );
  }

  BoardListTeamModel copyWith({
    List<Team>? teams,
  }) {
    return BoardListTeamModel(teams ?? this.teams);
  }

  @override
  String toString() {
    return 'BoardListTeamModel(teams: $teams)';
  }
}
