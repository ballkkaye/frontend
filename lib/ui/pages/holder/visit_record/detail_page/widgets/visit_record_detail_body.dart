import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/detail_page/widgets/visit_record_detail_content.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/detail_page/widgets/visit_record_detail_game.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/detail_page/widgets/visit_record_detail_img.dart';
import 'package:flutter/material.dart';

class VisitRecordDetailBody extends StatelessWidget {
  const VisitRecordDetailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              VisitRecordDetailGame(),
              SizedBox(height: 19),
              VisitRecordDetailImg(),
              SizedBox(height: 19),
              VisitRecordDetailContent(),
            ],
          ),
        ),
      ),
    );
  }
}
