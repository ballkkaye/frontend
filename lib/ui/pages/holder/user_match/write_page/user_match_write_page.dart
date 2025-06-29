import 'package:ballkkaye_frontend/ui/pages/holder/user_match/update_page/user_match_update_page.dart';
import 'package:flutter/material.dart';

import 'widgets/write_body.dart';

class UserMatchWritePage extends StatefulWidget {
  const UserMatchWritePage({super.key});

  @override
  State<UserMatchWritePage> createState() => _UserMatchWritePageState();
}

class _UserMatchWritePageState extends State<UserMatchWritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('동행 작성'),
        centerTitle: true,
      ),
      body: WriteBody(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => UserMatchUpdatePage()),
          );
        }),
      ),
    );
  }
}
