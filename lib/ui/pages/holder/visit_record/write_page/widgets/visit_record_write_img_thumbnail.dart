import 'package:flutter/material.dart';

class VisitRecordWriteThumbnail extends StatelessWidget {
  const VisitRecordWriteThumbnail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        'assets/images/visit_record_sample.jpg',
        width: double.infinity,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}
