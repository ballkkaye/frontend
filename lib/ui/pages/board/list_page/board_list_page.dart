import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/widgets/list_team_category_item.dart';
import 'package:flutter/material.dart';

class BoardListPage extends StatelessWidget {
  const BoardListPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool hasImg = false;

    return Scaffold(
      appBar: _appbar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/board/detail");
        },
      ),
      body: Column(
        children: [
          // 팀 카테고리 목록 (가로 스크롤)
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 11,
              itemBuilder: (context, index) {
                return ListTeamCategoryItem(label: '전체보기');
              },
            ),
          )
          // 게시글 목록 (세로 스크롤)
        ],
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: MText.h1("커뮤니티"),
      centerTitle: true,
    );
  }
}
