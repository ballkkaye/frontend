import 'package:flutter/material.dart';

import 'widgets/user_match_list_body.dart';

class UserMatchListPage extends StatelessWidget {
  const UserMatchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("동행", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              Icons.edit_square,
              color: Colors.grey,
            ),
          ),
        ],
        leading: Icon(Icons.arrow_back),
      ),
      body: UserMatchListBody(),
    );
  }
}
