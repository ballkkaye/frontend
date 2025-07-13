import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/board_list_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/home_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_board_list.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBoard extends ConsumerWidget {
  const HomeBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final homeModel = ref.watch(homeProvider);
    if (homeModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      final boards = homeModel.boardListModel.boards;
      return Column(
        children: [
          HomeHeading(
            title: '커뮤니티',
            uri: BoardListPage(),
          ),
          SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: MColor.kShadow.normal,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: HomeBoardList(boards: boards),
              ),
            ),
          ),
        ],
      );
    }
  }
}
