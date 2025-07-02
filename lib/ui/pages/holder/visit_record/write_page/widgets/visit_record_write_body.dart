import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/visit_record_write_form.dart';
import 'package:flutter/material.dart';

class VisitRecordWriteBody extends StatelessWidget {
  const VisitRecordWriteBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: VisitRecordWriteForm(),
    );
  }
}
