import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/detail_page/widgets/detail_content.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/detail_page/widgets/detail_game.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/detail_page/widgets/detail_img.dart';
import 'package:flutter/material.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            children: [
              DetailGame(),
              SizedBox(height: 19),
              DetailImg(),
              SizedBox(height: 19),
              DetailContent(),
            ],
          ),
        ),
      ),
    );
  }
}
