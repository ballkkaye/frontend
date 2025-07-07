import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:flutter/material.dart';

class VisitRecordDetailImg extends StatelessWidget {
  final VisitRecord visitRecord;

  const VisitRecordDetailImg({
    super.key,
    required this.visitRecord,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrls = visitRecord.imageString;

    if (imageUrls == null || imageUrls.isEmpty) {
      // TODO: 실제통신 시에는 이미지 주소가 없을 때 아무것도 출력하지 않을거임
      // return SizedBox.shrink();

      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          "assets/images/visit_record_sample.jpg",
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...imageUrls.map(
          (url) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                url,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
