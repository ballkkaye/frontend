import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:ballkkaye_frontend/data/repository/visit_record_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final VisitRecordDetailProvider =
    AutoDisposeNotifierProvider.family<VisitRecordDetailVM, VisitRecordDetailModel?, int>(() {
  return VisitRecordDetailVM();
});

class VisitRecordDetailVM extends AutoDisposeFamilyNotifier<VisitRecordDetailModel?, int> {
  final mContext = navigatorKey.currentContext!;

  @override
  VisitRecordDetailModel? build(int visitRecordId) {
    init(visitRecordId);

    return null;
  }

  Future<void> init(int visitRecordId) async {
    Map<String, dynamic> body = await VisitRecordRepository().getOne(visitRecordId);
    if (body["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("게시글 상세보기 실패 : ${body["msg"]}")),
      );
      return;
    }
    state = VisitRecordDetailModel.fromMap(body["body"]);
  }
}

class VisitRecordDetailModel {
  final VisitRecord visitRecord;

  VisitRecordDetailModel(this.visitRecord);

  VisitRecordDetailModel.fromMap(Map<String, dynamic> data) : visitRecord = VisitRecord.fromMap(data);

  VisitRecordDetailModel copyWith({
    VisitRecord? visitRecord,
  }) {
    return VisitRecordDetailModel(visitRecord ?? this.visitRecord);
  }

  @override
  String toString() {
    return 'VisitRecordDetailModel(visitRecord: $visitRecord)';
  }
}
