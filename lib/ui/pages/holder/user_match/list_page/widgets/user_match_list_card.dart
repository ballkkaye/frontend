import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/user_match.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/detail_page/user_match_detail_page.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_tag.dart';
import 'package:flutter/material.dart';

import 'user_match_list_card_header.dart';

class UserMatchListCard extends StatelessWidget {
  UserMatch userMatch;

  UserMatchListCard(this.userMatch);

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
              MaterialPageRoute(builder: (_) => UserMatchDetailPage(userMatch.matchId)),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 경기 정보 + 작성 시간
                UserMatchListCardHeader(
                  matchTitle: '${userMatch.game.awayTeam.name} vs ${userMatch.game.homeTeam.name}',
                  postedTime: userMatch.relativeTime!,
                ),

                SizedBox(height: 4),

                // 제목
                Text(
                  userMatch.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: MColor.kLabel.strong,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 18),

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
                            MTag(
                                label: userMatch.gender,
                                fillColor: MColor.kFill.normal,
                                textColor: MColor.kLabel.neutral),
                            MTag(
                                label: userMatch.age,
                                fillColor: MColor.kFill.normal,
                                textColor: MColor.kLabel.neutral),
                            MTag(
                                label: '${userMatch.user.teamName}', // TODO : 희망 응원팀으로 변경,
                                fillColor: MColor.kFill.normal,
                                textColor: MColor.kLabel.neutral),
                          ],
                        ),
                        // 같은 팀 체크박스 선택 했을 경우 = true
                        if (userMatch.isSameTeam!) ...[
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
                    MText.label2_7("${userMatch.participationInfo} 명 참여",
                        color: MColor.kLabel.strong),
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
