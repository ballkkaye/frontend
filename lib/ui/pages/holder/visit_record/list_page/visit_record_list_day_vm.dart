import 'package:ballkkaye_frontend/data/model/visit_record_list.dart';
import 'package:ballkkaye_frontend/data/repository/visit_record_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final VisitRecordListDayProvider = AutoDisposeNotifierProvider.family<VisitRecordListDayVM, List<VisitRecordList>?, String>(() {
  return VisitRecordListDayVM();
});

class VisitRecordListDayVM extends AutoDisposeFamilyNotifier<List<VisitRecordList>?, String> {
  final mContext = navigatorKey.currentContext!;

  @override
  List<VisitRecordList>? build(String date) {
    // 1. 상태 초기화
    loadListDay(date);

    // 3. 상태 값 세팅
    return null;
  }

  Future<void> loadListDay(String date) async {
    Map<String, dynamic> body = await VisitRecordRepository().getDayGameList(date);
    if (body["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("일별 직관기록 목록 조회 실패 : ${body["errorMessage"]}")),
      );
      return;
    }
    final List<dynamic> rawList = body["body"];
    final list = rawList.map((e) => VisitRecordListDayModel.fromMap(e)).toList();
    state = list;
  }
}

class VisitRecordListDayModel implements VisitRecordList {
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

  VisitRecordListDayModel({
    required this.id,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeScore,
    required this.awayScore,
    required this.gameDate,
    required this.stadiumName,
  });

  factory VisitRecordListDayModel.fromMap(Map<String, dynamic> map) {
    return VisitRecordListDayModel(
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
