import 'package:flutter/material.dart';

class VisitRecordThumbnail extends StatelessWidget {
  final imageUrl;

  const VisitRecordThumbnail({
    super.key,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        width: double.infinity,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}
