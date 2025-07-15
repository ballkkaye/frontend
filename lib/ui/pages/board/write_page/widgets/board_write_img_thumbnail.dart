import 'package:flutter/material.dart';

class BoardImgThumbnail extends StatelessWidget {
  final String? imageUrl;

  const BoardImgThumbnail({
    super.key,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return const SizedBox(); // 이미지 없으면 아무것도 안 그림
    }
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: Image.network(
              imageUrl!,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 10),
      ),
    );
  }
}
