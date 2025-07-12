import 'package:ballkkaye_frontend/data/param/matchup_param.dart';
import 'package:ballkkaye_frontend/data/repository/game_center_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final matchupProvider = AutoDisposeNotifierProvider.family<MatchupVM, MatchupModel?, MatchupParam>(() {
  return MatchupVM();
});

// TODO 3 : init 완성하기 (state 갱신)
class MatchupVM extends AutoDisposeFamilyNotifier<MatchupModel?, MatchupParam> {
  final mContext = navigatorKey.currentContext!;

  @override
  MatchupModel? build(MatchupParam param) {
    // 1. 상태 초기화
    //Future.microtask(() => init(param));
    init(param);

    // 3. 상태 값 세팅
    return null;
  }

  Future<void> init(MatchupParam param) async {
    Map<String, dynamic> body = await GameCenterRepository().getMatchup(
      gameId: param.gameId,
      teamId: param.teamId,
    );
    if (body["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("상대전적 조회 실패 : ${body["errorMessage"]}")),
      );
      return;
    }
    state = MatchupModel.fromMap(body["body"]);
  }
}

// TODO 2 : replies 빼고 상태로 관리하기
class MatchupModel {
  final int gameId;
  final int season;
  final List<Hitter> hitters;
  final String profileUrl;
  final String name;
  final int gameCount;
  final String result;
  final double era;
  final double whip;
  final int qs;

  MatchupModel({
    required this.gameId,
    required this.season,
    required this.hitters,
    required this.profileUrl,
    required this.name,
    required this.gameCount,
    required this.result,
    required this.era,
    required this.whip,
    required this.qs,
  });

  factory MatchupModel.fromMap(Map<String, dynamic> map) {
    return MatchupModel(
      gameId: map['gameId'],
      season: map['season'],
      hitters: List<Hitter>.from(map['hitters'].map((x) => Hitter.fromMap(x))),
      profileUrl: map['profileUrl'],
      name: map['name'],
      gameCount: map['gameCount'],
      result: map['result'],
      era: (map['era'] as num).toDouble(),
      whip: (map['whip'] as num).toDouble(),
      qs: map['qs'],
    );
  }
}

class Hitter {
  final double hitPredictionPer;
  final int teamId;
  final int hitterOrder;
  final String name;
  final String position;
  final int ab;
  final int h;
  final double avg;
  final double ops;

  Hitter({
    required this.hitPredictionPer,
    required this.teamId,
    required this.hitterOrder,
    required this.name,
    required this.position,
    required this.ab,
    required this.h,
    required this.avg,
    required this.ops,
  });

  factory Hitter.fromMap(Map<String, dynamic> map) {
    return Hitter(
      hitPredictionPer: (map['hitPredictionPer'] as num).toDouble(),
      teamId: map['teamId'],
      hitterOrder: map['hitterOrder'],
      name: map['name'],
      position: map['position'],
      ab: map['ab'],
      h: map['h'],
      avg: (map['avg'] as num).toDouble(),
      ops: (map['ops'] as num).toDouble(),
    );
  }
}
