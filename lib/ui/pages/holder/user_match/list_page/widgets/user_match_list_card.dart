import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/detail_page/user_match_detail_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/widgets/m_text_pill.dart';
import 'package:flutter/material.dart';

class UserMatchListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      clipBehavior: Clip.hardEdge, // 중요! ripple overflow 방지
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => UserMatchDetailPage()),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 경기 정보 + 작성 시간
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "롯데 자이언츠 vs 두산 베어스",
                    style: TextStyle(
                      fontSize: 13,
                      color: MColor.kLabel.neutral,
                    ),
                  ),
                  Text(
                    "15분전",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: MColor.kLabel.strong,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),

              // 제목
              MText.input500("직관같이갑시다", color: MColor.kLabel.strong),
              SizedBox(height: 6),

              // 태그들
              Wrap(
                spacing: 8,
                children: [
                  MTextPill(label: "여성"),
                  MTextPill(label: "20대 이상"),
                  MTextPill(label: "롯데 자이언츠"),
                ],
              ),
              SizedBox(height: 10),

              // 같은 팀 선호 여부
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  true
                      ? Row(
                          children: [
                            Icon(Icons.check_box, size: 16, color: MColor.kPrimary.alternative),
                            SizedBox(width: 4),
                            MText.label2_700("같은 팀이면 좋겠어요", color: MColor.kPrimary.alternative),
                          ],
                        )
                      : SizedBox.shrink(),
                  MText.label2_500("2/6 명 참여", color: MColor.kLabel.strong),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
