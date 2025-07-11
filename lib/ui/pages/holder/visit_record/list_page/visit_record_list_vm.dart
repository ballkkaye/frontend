import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:ballkkaye_frontend/data/repository/visit_record_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final visitRecordListProvider = AutoDisposeNotifierProvider<VisitRecordListVM, List<VisitRecord>?>(
  VisitRecordListVM.new,
);

class VisitRecordListVM extends AutoDisposeNotifier<List<VisitRecord>?> {
  final mContext = navigatorKey.currentContext!;

  @override
  List<VisitRecord>? build() => null;

  Future<void> loadMonth({required int year, required int month}) async {
    final body = await VisitRecordRepository().getMonthGameList(year: year, month: month);
    if (body["status"] != 200) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("월별 조회 실패: ${body['errorMessage']}")),
      );
      return;
    }

    final List<dynamic> rawList = body["body"];
    final list = rawList.map((e) => VisitRecord.fromMap(e)).toList();

    state = list;
  }

  Future<void> loadDay(String date) async {
    state = null;
    final body = await VisitRecordRepository().getDayGameList(date);
    if (body["status"] != 200) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("일별 조회 실패: ${body['errorMessage']}")),
      );
      return;
    }

    final List<dynamic> rawList = body["body"];
    final list = rawList.map((e) => VisitRecord.fromMap(e)).toList();

    state = list;
  }
}
