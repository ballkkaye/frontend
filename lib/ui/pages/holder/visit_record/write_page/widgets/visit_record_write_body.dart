import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/visit_record_write_form.dart';
import 'package:flutter/material.dart';

class VisitRecordWriteBody extends StatelessWidget {
  final VisitRecord selectedGame;
  const VisitRecordWriteBody({
    super.key,
    required this.selectedGame,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: VisitRecordWriteForm(selectedGame: selectedGame),
    );
  }
}
