import 'package:ballkkaye_frontend/ui/pages/board/update_page/widgets/update_form.dart';
import 'package:flutter/material.dart';

class BoardUpdateBody extends StatelessWidget {
  const BoardUpdateBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 12),
      child: UpdateForm(),
    );
  }
}
