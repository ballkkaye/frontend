import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class BoardListTeamCategoryList extends StatelessWidget {
  const BoardListTeamCategoryList({
    super.key,
    required this.label,
    this.imgUrl,
    this.rank,
  });

  final String label;
  final String? imgUrl;
  final int? rank;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {}, // TODO : 클릭시 카테고리별 조회
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: imgUrl != null ? null : MColor.kPrimary.strong,
                  radius: 30,
                  child: imgUrl != null
                      ? Image.network(
                          imgUrl!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/lotte_emblem_sample.jpg', //서버에서 사진추가 다되면 여기코드 제거예정
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : Text(
                          label[0] + label[1],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                ),
                if (rank == 1)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: MText.label3('1위', color: Colors.white),
                    ),
                  ),
              ],
            ),
            MText.label1_5(label, color: MColor.kLabel.normal),
          ],
        ),
      ),
    );
  }
}
