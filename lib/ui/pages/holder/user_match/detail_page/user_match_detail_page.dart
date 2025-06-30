import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/write_page/user_match_write_page.dart';
import 'package:flutter/material.dart';

import 'widgets/detail_action_sheet.dart';
import 'widgets/detail_body.dart';

class UserMatchDetailPage extends StatelessWidget {
  const UserMatchDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: DetailBody(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 210),
        child: FloatingActionButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => UserMatchWritePage()),
          );
        }),
      ),
    );
  }

  PreferredSizeWidget _appbar(BuildContext context) {
    return AppBar(
      title: MText.h1("동행"),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        DetailActionSheet(),
        SizedBox(width: 16),
      ],
      elevation: 0,
    );
  }
}
