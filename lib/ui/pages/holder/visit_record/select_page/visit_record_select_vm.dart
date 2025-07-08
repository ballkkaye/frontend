import 'package:ballkkaye_frontend/data/repository/visit_record_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final visitRecordSelectProvider = AutoDisposeNotifierProvider.family<VisitRecordSelectVM, VisitRecordSelectModel?, String>(
  () => VisitRecordSelectVM(),
);

class VisitRecordSelectVM extends AutoDisposeFamilyNotifier<VisitRecordSelectModel?, String> {
  final mContext = navigatorKey.currentContext!;

  @override
  VisitRecordSelectModel? build(String date) {
    init(date);
    return null;
  }

  Future<void> init(String date) async {
    final body = await VisitRecordRepository().getSelectGame(date);

    if (body["status"] != 200) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("경기 가져오기 실패 : ${body["msg"]}")),
      );
      return;
    }

    final bodyData = body["body"] as Map<String, dynamic>;
    state = VisitRecordSelectModel.fromMap(bodyData);
  }

  Future<VisitRecordSelectModel?> getModel(String date) async {
    await init(date);
    return state;
  }
}

class VisitRecordSelectModel {
  final List<VisitRecord> records;

  VisitRecordSelectModel(this.records);

  factory VisitRecordSelectModel.fromMap(Map<String, dynamic> data) {
    final games = data["games"] as List<dynamic>;

    if (games.isEmpty) {
      return VisitRecordSelectModel([]);
    }

    final items = games.first["items"] as List<dynamic>?;

    if (items == null || items.isEmpty) {
      return VisitRecordSelectModel([]);
    }

    final records = items.map((e) => VisitRecord.fromMap(e)).toList();

    return VisitRecordSelectModel(records);
  }

  VisitRecordSelectModel copyWith({
    List<VisitRecord>? records,
  }) {
    return VisitRecordSelectModel(records ?? this.records);
  }

  @override
  String toString() => 'VisitRecordSelectModel(records: $records)';
}

class VisitRecord {
  final int gameId;
  final String homeTeamFullName;
  final String homeTeamShortName;
  final int homeTeamScore;
  final String awayTeamFullName;
  final String awayTeamShortName;
  final int awayTeamScore;
  final String stadiumFullName;
  final String stadiumShortName;
  final String gameDate;

  VisitRecord({
    required this.gameId,
    required this.homeTeamFullName,
    required this.homeTeamShortName,
    required this.homeTeamScore,
    required this.awayTeamFullName,
    required this.awayTeamShortName,
    required this.awayTeamScore,
    required this.stadiumFullName,
    required this.stadiumShortName,
    required this.gameDate,
  });

  factory VisitRecord.fromMap(Map<String, dynamic> map) {
    return VisitRecord(
      gameId: map['gameId'],
      homeTeamFullName: map['homeTeamFullName'],
      homeTeamShortName: map['homeTeamShortName'],
      homeTeamScore: map['homeTeamScore'],
      awayTeamFullName: map['awayTeamFullName'],
      awayTeamShortName: map['awayTeamShortName'],
      awayTeamScore: map['awayTeamScore'],
      stadiumFullName: map['stadiumFullName'],
      stadiumShortName: map['stadiumShortName'],
      gameDate: map['gameDate'],
    );
  }

  @override
  String toString() => 'VisitRecord(gameId: $gameId)';
}
