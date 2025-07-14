import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:ballkkaye_frontend/data/repository/visit_record_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final visitRecordDetailProvider = AutoDisposeNotifierProvider.family<VisitRecordDetailVM, VisitRecord?, int>(() {
  return VisitRecordDetailVM();
});

class VisitRecordDetailVM extends AutoDisposeFamilyNotifier<VisitRecord?, int> {
  final mContext = navigatorKey.currentContext!;

  @override
  VisitRecord? build(int id) {
    init(id);

    return null;
  }

  Future<void> init(int id) async {
    Map<String, dynamic> body = await VisitRecordRepository().getOne(id);
    if (body["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("게시글 상세보기 실패 : ${body["msg"]}")),
      );
      return;
    }
    state = VisitRecord.fromMap(body["body"]);
  }
}
