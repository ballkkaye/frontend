import 'package:ballkkaye_frontend/ui/pages/board/list_page/widgets/list_team_category_item.dart';
import 'package:flutter/material.dart';

class ListTeamCategory extends StatelessWidget {
  const ListTeamCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 11,
          itemBuilder: (context, index) {
            if (index == 0)
              return ListTeamCategoryItem(label: '전체보기');
            else
              return ListTeamCategoryItem(
                label: '롯데',
                imgUrl: 'assets/images/lotte_emblem_sample.jpg',
                rank: 1,
              );
          },
        ),
      ),
    );
  }
}
