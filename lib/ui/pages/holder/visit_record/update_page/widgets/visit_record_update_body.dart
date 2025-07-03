import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/update_page/widgets/visit_record_update_form.dart';
import 'package:flutter/material.dart';

class VisitRecordUpdateBody extends StatelessWidget {
  const VisitRecordUpdateBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: VisitRecordUpdateForm(),
    );
  }
}
