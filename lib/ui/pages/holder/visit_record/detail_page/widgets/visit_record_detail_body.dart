import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/detail_page/visit_record_detail_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/detail_page/widgets/visit_record_detail_content.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/detail_page/widgets/visit_record_detail_game.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/detail_page/widgets/visit_record_detail_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VisitRecordDetailBody extends ConsumerWidget {
  final int visitRecordId;

  VisitRecordDetailBody({
    super.key,
    required this.visitRecordId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    VisitRecord? model = ref.watch(visitRecordDetailProvider(visitRecordId));
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: MColor.kShadow.normal,
            color: MColor.kBackground.normal,
          ),
          child: Padding(
            padding: EdgeInsets.all(14),
            child: Column(
              children: [
                VisitRecordDetailGame(record: model),
                SizedBox(height: 19),
                VisitRecordDetailImg(visitRecord: model),
                SizedBox(height: 19),
                VisitRecordDetailContent(visitRecord: model),
              ],
            ),
          ),
        ),
      );
    }
  }
}
