import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:flutter/material.dart';

class VisitRecordDetailImg extends StatelessWidget {
  final VisitRecord visitRecord;

  const VisitRecordDetailImg({
    super.key,
    required this.visitRecord,
  });

  // TODO: 이미지는 마지막에
  @override
  Widget build(BuildContext context) {
    final img = visitRecord.imageString;
    if (img != null && img.isNotEmpty) {
      // TODO: 실제통신 시에는 이미지 주소가 없을 때 아무것도 출력하지 않을거임
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                img,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        ],
      );

      // return ClipRRect(
      //   borderRadius: BorderRadius.circular(8),
      //   child: Image.asset(
      //     "assets/images/visit_record_sample.jpg",
      //     fit: BoxFit.cover,
      //     width: double.infinity,
      //   ),
      // );
    }

    return SizedBox.shrink();
  }
}
