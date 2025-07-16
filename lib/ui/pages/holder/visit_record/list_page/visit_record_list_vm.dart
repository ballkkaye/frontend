import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:ballkkaye_frontend/data/repository/visit_record_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/detail_page/visit_record_detail_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/visit_record_write_fm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final visitRecordListProvider = AutoDisposeNotifierProvider<VisitRecordListVM, List<VisitRecordListModel>?>(
  VisitRecordListVM.new,
);

class VisitRecordListVM extends AutoDisposeNotifier<List<VisitRecordListModel>?> {
  final mContext = navigatorKey.currentContext!;

  @override
  List<VisitRecordListModel>? build() => null;

  Future<void> loadMonth({required int year, required int month}) async {
    Logger().d("🟡 loadMonth 호출됨 → year=$year, month=$month");
    final body = await VisitRecordRepository().getMonthGameList(year: year, month: month);
    Logger().d("📦 loadMonth 응답 body: $body");
    if (body["status"] != 200) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("월별 조회 실패: ${body['errorMessage']}")),
      );
      return;
    }
    final List<VisitRecordListModel> list =
        (body['body'] as List<dynamic>).map((e) => VisitRecordListModel.fromMap(e as Map<String, dynamic>)).toList();

    state = list;
  }

  Future<void> loadDay(String date) async {
    state = null;
    final body = await VisitRecordRepository().getDayGameList(date: date);
    Logger().d("📅 선택된 날짜: $date");
    Logger().d("📡 API 응답 전체: $body");
    Logger().d("📡 body['body']: ${body['body']}");
    Logger().d("📡 body['status']: ${body['status']}");
    Logger().d("📡 body['msg']: ${body['msg']}");
    if (body["status"] != 200) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("일별 조회 실패: ${body['errorMessage']}")),
      );
      return;
    }
    final List<VisitRecordListModel> list =
        (body['body'] as List<dynamic>).map((e) => VisitRecordListModel.fromMap(e as Map<String, dynamic>)).toList();

    state = list;
  }

  Future<void> writeVisitRecord(VisitRecordWriteModel model) async {
    Logger().d("글쓰기 요청 : ${model.toMap()}");

    final data = await VisitRecordRepository().write(model.toMap());

    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("직관기록 쓰기 실패: ${data["msg"]}")),
      );
      return;
    }

    final newRecord = VisitRecord.fromMap(data["body"]);
    final newModel = VisitRecordListModel(
      newRecord.id,
      newRecord.homeTeamName,
      newRecord.awayTeamName,
      newRecord.homeScore,
      newRecord.awayScore,
      newRecord.gameDate,
      newRecord.stadiumName,
    );

    state = [newModel, ...(state ?? [])];

    Navigator.pop(mContext);
    Navigator.push(
      mContext,
      MaterialPageRoute(
        builder: (context) => VisitRecordDetailPage(visitRecordId: newRecord.id!),
      ),
    );
  }

  void notifyDeleteOne(int visitRecordId) {
    if (state == null) return;
    final updatedList = state!.where((record) => record.id != null && record.id != visitRecordId).toList();
    state = updatedList;
  }
}

// List 형태
class VisitRecordListModel {
  int? id;
  String? homeTeamName;
  String? awayTeamName;
  int? homeScore;
  int? awayScore;
  String? gameDate;
  String? stadiumName;

  VisitRecordListModel(
    this.id,
    this.homeTeamName,
    this.awayTeamName,
    this.homeScore,
    this.awayScore,
    this.gameDate,
    this.stadiumName,
  );

  VisitRecordListModel.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        homeTeamName = data['homeTeamName'],
        awayTeamName = data['awayTeamName'],
        homeScore = data['homeScore'],
        awayScore = data['awayScore'],
        gameDate = data['gameDate'],
        stadiumName = data['stadiumName'];

  VisitRecordListModel copyWith({
    int? id,
    String? homeTeamName,
    String? awayTeamName,
    int? homeScore,
    int? awayScore,
    String? gameDate,
    String? stadiumName,
  }) {
    return VisitRecordListModel(
      id ?? this.id,
      homeTeamName ?? this.homeTeamName,
      awayTeamName ?? this.awayTeamName,
      homeScore ?? this.homeScore,
      awayScore ?? this.awayScore,
      gameDate ?? this.gameDate,
      stadiumName ?? this.stadiumName,
    );
  }

  @override
  String toString() {
    return 'VisitRecordListModel{id: $id, homeTeamName: $homeTeamName, awayTeamName: $awayTeamName, homeScore: $homeScore, awayScore: $awayScore, gameDate: $gameDate, stadiumName: $stadiumName,}';
  }
}
