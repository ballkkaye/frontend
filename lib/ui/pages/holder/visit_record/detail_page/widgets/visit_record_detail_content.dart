import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:flutter/material.dart';

class VisitRecordDetailContent extends StatelessWidget {
  VisitRecord visitRecord;

  VisitRecordDetailContent({
    super.key,
    required this.visitRecord,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: MText.normal6_5(
          '''${visitRecord.content}''',
        ),
      ),
    );
  }
}
