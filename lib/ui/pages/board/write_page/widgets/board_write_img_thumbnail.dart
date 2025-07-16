import 'package:flutter/material.dart';

class BoardImgThumbnail extends StatelessWidget {
  final List<String> imageUrls;

  const BoardImgThumbnail({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrls.isEmpty) {
      return const SizedBox.shrink(); // 아무것도 표시하지 않는 위젯
    }

    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          final String currentImageUrl = imageUrls[index];
          return ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: Image.network(
              currentImageUrl,
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
