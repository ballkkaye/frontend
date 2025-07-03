import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_board_content.dart';
import 'package:flutter/material.dart';

class HomeBoardList extends StatelessWidget {
  const HomeBoardList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 32,
      children: [
        HomeBoardContent(),
        HomeBoardContent(),
        HomeBoardContent(),
        HomeBoardContent(),
        HomeBoardContent(),
      ],
    );
  }
}
