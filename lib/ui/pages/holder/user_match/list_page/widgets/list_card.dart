import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/detail_page/user_match_detail_page.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_tag.dart';
import 'package:flutter/material.dart';

import 'list_card_header.dart';

class ListCard extends StatelessWidget {
  const ListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 1, left: 16, right: 16, bottom: 9),
      decoration: BoxDecoration(
        color: MColor.kBackground.normal,
        borderRadius: BorderRadius.circular(8),
        boxShadow: MColor.kShadow.normal,
      ),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => UserMatchDetailPage()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 경기 정보 + 작성 시간
                const ListCardHeader(
                  matchTitle: "롯데 자이언츠 vs 두산 베어스",
                  postedTime: "15분전",
                ),

                const SizedBox(height: 4),

                // 제목
                //MText.modal2_5("직관같이갑시다", color: MColor.kLabel.strong),
                Text(
                  '직관 같이 갑시다갑시다갑시다갑시다갑시다갑시다갑시다갑시다갑시다',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: MColor.kLabel.strong,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 18),

                // 태그 + 같은 팀이면 + 참여 인원
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 5,
                          children: [
                            MTag(label: '여성', fillColor: MColor.kFill.normal, textColor: MColor.kLabel.neutral),
                            MTag(label: '20대 이상', fillColor: MColor.kFill.normal, textColor: MColor.kLabel.neutral),
                            MTag(label: '롯데 자이언츠', fillColor: MColor.kFill.normal, textColor: MColor.kLabel.neutral),
                          ],
                        ),
                        // 같은 팀 체크박스 선택 했을 경우 = true
                        if (true) ...[
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.check_box, size: 16, color: MColor.kPrimary.strong),
                              SizedBox(width: 4),
                              MText.label2_5("같은 팀이면 좋겠어요", color: MColor.kPrimary.strong),
                            ],
                          ),
                        ],
                      ],
                    ),
                    MText.label2_7("2/6 명 참여", color: MColor.kLabel.strong),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
