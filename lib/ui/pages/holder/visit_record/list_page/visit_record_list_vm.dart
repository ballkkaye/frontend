import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:ballkkaye_frontend/data/repository/visit_record_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/detail_page/visit_record_detail_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/visit_record_write_fm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final visitRecordListProvider =
    AutoDisposeNotifierProvider<VisitRecordListVM, List<VisitRecord>?>(
  VisitRecordListVM.new,
);

class VisitRecordListVM extends AutoDisposeNotifier<List<VisitRecord>?> {
  final mContext = navigatorKey.currentContext!;

  @override
  List<VisitRecord>? build() => null;

  Future<void> loadMonth({required int year, required int month}) async {
    final body = await VisitRecordRepository()
        .getMonthGameList(year: year, month: month);
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

    // 현재 state가 null이면 빈 리스트로 시작
    final nextRecords = <VisitRecord>[newRecord, ...?state ?? []];

    // state 업데이트 (작성한 데이터 맨 앞에 추가)
    state = nextRecords;

    // 페이지 이동
    Navigator.pop(mContext);
    Navigator.push(
      mContext,
      MaterialPageRoute(
        builder: (context) => VisitRecordDetailPage(
          visitRecordId: newRecord.gameId!,
        ),
      ),
    );
  }
}
