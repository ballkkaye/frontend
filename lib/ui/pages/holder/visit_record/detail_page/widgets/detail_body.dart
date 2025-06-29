import 'package:ballkkaye_frontend/_core/style/m_color.dart';
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
    String result = 'win';

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      child: Column(
        children: [
          Container(
            height: 30,
            width: 60,
            margin: EdgeInsetsGeometry.directional(start: 250, end: 16),
            decoration: BoxDecoration(
              color: result == 'win'
                  ? MColor.kPrimary.strong
                  : MColor.kLabel.disable,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Center(
                child: Text(
              '승',
              style: TextStyle(fontSize: 14, color: Colors.white),
            )),
          ),
          Card(
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
        ],
      ),
    );
  }
}
