import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class ListTeamCategoryItem extends StatelessWidget {
  const ListTeamCategoryItem({
    super.key,
    required this.label,
    this.imgUrl,
  });

  final String label;
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: imgUrl != null ? null : MColor.kPrimary.strong,
            radius: 30,
            child: imgUrl != null
                ? ClipOval(
                    child: Image.asset(
                      imgUrl!,
                      fit: BoxFit.cover,
                    ),
                  )
                : Text(
                    label[0], // 첫 글자 표시
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
          ),
          SizedBox(height: 10),
          MText.label1_5(label, color: MColor.kLabel.normal),
        ],
      ),
    );
  }
}
