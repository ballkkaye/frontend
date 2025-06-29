import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class WriteIconBtn extends StatelessWidget {
  const WriteIconBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {}, // TODO : image_picker 사용해서 이미지 첨부하기 기능 구현
        icon: MIcon.page.record.camera,
        label: MText.button3("사진 첨부하기", color: MColor.kLabel.alternative),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: BorderSide(
            color: MColor.kLine.normal,
          ),
          padding: EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}
