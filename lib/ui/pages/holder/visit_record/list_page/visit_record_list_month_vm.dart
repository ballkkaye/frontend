import 'package:ballkkaye_frontend/data/model/visit_record_list.dart';
import 'package:ballkkaye_frontend/data/param/visit_record_param.dart';
import 'package:ballkkaye_frontend/data/repository/visit_record_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final VisitRecordListMonthProvider =
    AutoDisposeNotifierProvider.family<VisitRecordListMonthVM, List<VisitRecordList>?, VisitRecordParam>(VisitRecordListMonthVM.new);

class VisitRecordListMonthVM extends AutoDisposeFamilyNotifier<List<VisitRecordList>?, VisitRecordParam> {
  final mContext = navigatorKey.currentContext!;

  @override
  List<VisitRecordList>? build(VisitRecordParam param) {
    // 1. 상태 초기화
    //Future.microtask(() => init(param));
    loadListMonth(param);

    // 3. 상태 값 세팅
    return null;
  }

  Future<void> loadListMonth(VisitRecordParam param) async {
    Map<String, dynamic> body = await VisitRecordRepository().getMonthGameList(
      year: param.year,
      month: param.month,
    );
    if (body["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("월별 직관기록 목록 조회 실패 : ${body["errorMessage"]}")),
      );
      return;
    }
    final List<dynamic> rawList = body["body"];
    final list = rawList.map((e) => VisitRecordListMonthModel.fromMap(e)).toList();
    state = list;
  }
}

class VisitRecordListMonthModel implements VisitRecordList {
  @override
  final int id;
  @override
  final String homeTeamName;
  @override
  final String awayTeamName;
  @override
  final int homeScore;
  @override
  final int awayScore;
  @override
  final String gameDate;
  @override
  final String stadiumName;

  VisitRecordListMonthModel({
    required this.id,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeScore,
    required this.awayScore,
    required this.gameDate,
    required this.stadiumName,
  });

  factory VisitRecordListMonthModel.fromMap(Map<String, dynamic> map) {
    return VisitRecordListMonthModel(
      id: map['id'],
      homeTeamName: map['homeTeamName'],
      awayTeamName: map['awayTeamName'],
      homeScore: map['homeScore'],
      awayScore: map['awayScore'],
      gameDate: map['gameDate'],
      stadiumName: map['stadiumName'],
    );
  }
}
