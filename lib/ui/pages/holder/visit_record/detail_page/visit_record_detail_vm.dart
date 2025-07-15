import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:ballkkaye_frontend/data/repository/visit_record_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/visit_record_list_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final visitRecordDetailProvider = AutoDisposeNotifierProvider.family<
    VisitRecordDetailVM, VisitRecordDetailModel?, int>(() {
  return VisitRecordDetailVM();
});

class VisitRecordDetailVM
    extends AutoDisposeFamilyNotifier<VisitRecordDetailModel?, int> {
  final mContext = navigatorKey.currentContext!;

  @override
  VisitRecordDetailModel? build(int visitRecordId) {
    init(visitRecordId);

    ref.onDispose(() {
      Logger().d("VisitRecordDetailVM 파괴됨");
    });

    return null;
  }

  Future<void> init(int visitRecordId) async {
    Map<String, dynamic> body =
        await VisitRecordRepository().getOne(visitRecordId);
    if (body["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("게시글 상세보기 실패 : ${body["msg"]}")),
      );
      return;
    }
    state = VisitRecordDetailModel.fromMap(body["body"]);
    Logger().d(state);
  }

  Future<void> deleteOne(int visitRecordId, WidgetRef ref) async {
    final body = await VisitRecordRepository().deleteOne(visitRecordId);
    if (body["status"] != 200) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(content: Text("직관 기록 삭제 실패: ${body["errorMessage"]}")),
      );
      return;
    }
    ref.read(visitRecordListProvider.notifier).notifyDeleteOne(visitRecordId);
    Navigator.pop(navigatorKey.currentContext!);
  }
}

class VisitRecordDetailModel {
  VisitRecord visitRecord;

  VisitRecordDetailModel(this.visitRecord);

  VisitRecordDetailModel.fromMap(Map<String, dynamic> data)
      : visitRecord = VisitRecord.fromMap(data);

  VisitRecordDetailModel copyWith({VisitRecord? visitRecord}) {
    return VisitRecordDetailModel(visitRecord ?? this.visitRecord);
  }
}
