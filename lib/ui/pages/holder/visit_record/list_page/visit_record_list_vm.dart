import 'package:ballkkaye_frontend/data/repository/visit_record_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final VisitRecordListProvider = AutoDisposeNotifierProvider.family<VisitRecordListVM, VisitRecordListModel?, String>(() {
  return VisitRecordListVM();
});

class VisitRecordListVM extends AutoDisposeFamilyNotifier<VisitRecordListModel?, String> {
  final mContext = navigatorKey.currentContext!;

  @override
  VisitRecordListModel? build(String date) {
    state = VisitRecordListModel();
    loadRecordDayGameList(date);
    loadRecordMonthGameList(date);
    return state;
  }

  // 선택된 날짜 직관기록 리스트 조회
  Future<void> loadRecordDayGameList(String date) async {
    final res = await VisitRecordRepository().getDayGameList(date);
    if (res["status"] != 200) {
      _showError("직관기록 일별 조회 실패", res["msg"]);
      return;
    }

    state = state?.copyWith(dayRecords: res["body"]);
  }

  // 선택된 달 직관기록 리스트 조회
  Future<void> loadRecordMonthGameList(String date) async {
    final res = await VisitRecordRepository().getMonthGameList(date);
    if (res["status"] != 200) {
      _showError("직관기록 월별 조회 실패", res["msg"]);
      return;
    }

    state = state?.copyWith(monthRecords: res["body"]);
  }

  void _showError(String title, String msg) {
    ScaffoldMessenger.of(mContext).showSnackBar(
      SnackBar(content: Text("$title: $msg")),
    );
  }
}

// 전체 리스트 모델
class VisitRecordListModel {
  final List<RecordModel>? dayRecords;
  final List<RecordModel>? monthRecords;

  VisitRecordListModel({
    this.dayRecords,
    this.monthRecords,
  });

  VisitRecordListModel copyWith({
    List<RecordModel>? dayRecords,
    List<RecordModel>? monthRecords,
  }) {
    return VisitRecordListModel(
      dayRecords: dayRecords ?? this.dayRecords,
      monthRecords: monthRecords ?? this.monthRecords,
    );
  }

  @override
  String toString() {
    return 'VisitRecordListModel('
        'dayRecords: $dayRecords, '
        'monthRecords: $monthRecords)';
  }
}

class MonthDTO {
  final String month;
  final List<DayDTO> day;

  MonthDTO({required this.month, required this.day});

  factory MonthDTO.fromMap(Map<String, dynamic> map) {
    return MonthDTO(
      month: map['month'],
      day: (map['day'] as List).map((e) => DayDTO.fromMap(e)).toList(),
    );
  }
}

class DayDTO {
  final String day;
  final bool isHaveGame;

  DayDTO({required this.day, required this.isHaveGame});

  factory DayDTO.fromMap(Map<String, dynamic> map) {
    return DayDTO(
      day: map['day'],
      isHaveGame: map['isHaveGame'],
    );
  }
}

// 일별 월별 직관기록 공통 모델
class RecordModel {
  final int id;
  final String homeTeamName;
  final String awayTeamName;
  final int homeScore;
  final int awayScore;
  final String gameDate;
  final String stadiumName;

  RecordModel({
    required this.id,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeScore,
    required this.awayScore,
    required this.gameDate,
    required this.stadiumName,
  });

  factory RecordModel.fromMap(Map<String, dynamic> map) {
    return RecordModel(
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
