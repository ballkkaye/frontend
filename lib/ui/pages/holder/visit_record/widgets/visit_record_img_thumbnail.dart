import 'package:flutter/material.dart';

class VisitRecordThumbnail extends StatelessWidget {
  final String imageUrl;
  const VisitRecordThumbnail({
    super.key,
    required this.imageUrl,
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
