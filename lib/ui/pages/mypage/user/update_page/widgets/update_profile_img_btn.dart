import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:flutter/material.dart';

class UpdateProfileImgBtn extends StatelessWidget {
  const UpdateProfileImgBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {}, // TODO : image_picker로 이미지 가져오기
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              backgroundColor: MColor.kFill.normal,
              radius: 40,
              child: SizedBox(
                width: 40,
                height: 40,
                child: MIcon.page.mypage.image,
              ), // 이미지 있으면 이미지로 대체되도록
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Center(
                  child: SizedBox(
                    width: 14,
                    height: 14,
                    child: MIcon.page.mypage.plus, // + 아이콘
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
