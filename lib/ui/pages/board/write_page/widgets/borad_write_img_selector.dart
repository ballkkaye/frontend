import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class BoardWriteImgSelector extends StatelessWidget {
  const BoardWriteImgSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 이미지 추가 버튼
        InkWell(
          onTap: () {}, // TODO : image_picker 연결
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(color: MColor.kFill.normal, borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_a_photo_outlined, color: MColor.kLabel.alternative),
                Text(
                  "0/10",
                  style: TextStyle(color: MColor.kLabel.alternative),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10),
        // 이미지 썸네일
        Expanded(
          child: SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(8),
                  child: Image.asset(
                    "assets/images/visit_record_sample.jpg",
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 10),
            ),
          ),
        )
      ],
    );
  }
}
