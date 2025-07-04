import 'package:ballkkaye_frontend/ui/pages/board/write_page/widgets/borad_write_form.dart';
import 'package:flutter/material.dart';

class BoardWriteBody extends StatelessWidget {
  BoardWriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 12),
      child: BoardWriteForm(),
    );
  }
}
