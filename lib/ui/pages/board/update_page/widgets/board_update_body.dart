import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:ballkkaye_frontend/ui/pages/board/update_page/widgets/borad_update_form.dart';
import 'package:flutter/material.dart';

class BoardUpdateBody extends StatelessWidget {
  final Board board;

  BoardUpdateBody(this.board);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 12),
      child: BoardUpdateForm(board),
    );
  }
}
