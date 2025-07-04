import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/widgets/borad_list_card.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/widgets/borad_list_team_category_item.dart';
import 'package:flutter/material.dart';

class BoardListBody extends StatelessWidget {
  const BoardListBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 팀 카테고리 목록 (가로 스크롤)
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: MColor.kLine.normal,
            width: 1,
          ))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 11,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return BoardListTeamCategoryItem(label: '전체보기');
                  } else {
                    return BoardListTeamCategoryItem(
                      label: '롯데',
                      imgUrl: 'assets/images/lotte_emblem_sample.jpg',
                      rank: 1,
                    );
                  }
                },
              ),
            ),
          ),
        ),
        // 게시글 목록 (세로 스크롤)
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 16),
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: 10,
            itemBuilder: (context, index) {
              return BoardListCard(
                boardId: 3,
                accessToken:
                    "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhY2Nlc3MtdG9rZW4iLCJuaWNrbmFtZSI6InNzYXIiLCJ1c2Vycm9sZSI6IlVTRVIiLCJpZCI6MSwiZXhwIjoxNzUxNjE1OTA4fQ.a8S5gV9s_a-wnbPPg9G8A2hMCRlZhnm21J0kny8dxL6OLnGPtI-4MAUDy-P8rbJDn_o_bxbY5zwjqmo_2E7w5g",
              );
            },
          ),
        ),
      ],
    );
  }
}
