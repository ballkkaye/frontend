import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class DetailProfileCard extends StatelessWidget {
  const DetailProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: MColor.kShadow.normal,
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.5),
                  child: ClipOval(
                    child: Container(
                      width: 30,
                      height: 30,
                      color: MColor.kFill.normal,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 21,
                          height: 21,
                          child: MIcon.page.mypage.userDummy,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MText.normal4_600("ssar", color: MColor.kLabel.normal),
                      MText.normal6_500("롯데 자이언츠", color: MColor.kLabel.alternative),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // 로그아웃 로직
                  },
                  style: TextButton.styleFrom(
                      minimumSize: const Size(0, 20),
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  child: MText.button4_5('로그아웃', color: MColor.kStatus.negative),
                ),
              ],
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/user/update');
                },
                child: MText.button4_5("프로필 수정", color: MColor.kLabel.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
