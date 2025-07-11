import 'package:ballkkaye_frontend/data/repository/game_center_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rankingProvider = AutoDisposeNotifierProvider<RankingVM, List<RankingModel>>(
  RankingVM.new,
);

class RankingVM extends AutoDisposeNotifier<List<RankingModel>> {
  final mContext = navigatorKey.currentContext!;

  @override
  List<RankingModel> build() {
    loadRanking();

    return [];
  }

  Future<void> loadRanking() async {
    final response = await GameCenterRepository().getRanking();
    if (response["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("팀 순위 조회 실패 : ${response["msg"]}")),
      );
      return;
    }
    final List<dynamic> body = response["body"];
    state = body.map((e) => RankingModel.fromMap(e)).toList();
  }
}

class RankingModel {
  String teamName;
  double gap;
  int winGame;
  int loseGame;
  int tieGame;
  int totalGame;
  double winRate;
  int teamRank;
  String recentTenGame;
  String streak;

  RankingModel({
    required this.teamName,
    required this.gap,
    required this.winGame,
    required this.loseGame,
    required this.tieGame,
    required this.totalGame,
    required this.winRate,
    required this.teamRank,
    required this.recentTenGame,
    required this.streak,
  });

  RankingModel.fromMap(Map<String, dynamic> data)
      : teamName = data['teamName'],
        gap = data['gap'],
        winGame = data['winGame'],
        loseGame = data['loseGame'],
        tieGame = data['tieGame'],
        totalGame = data['totalGame'],
        winRate = data['winRate'],
        teamRank = data['teamRank'],
        recentTenGame = data['recentTenGame'],
        streak = data['streak'];
}
