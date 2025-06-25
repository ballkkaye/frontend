import 'package:flutter/material.dart';

class VisitRecordDetailImage extends StatelessWidget {
  const VisitRecordDetailImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        'assets/images/visit_record_sample.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
