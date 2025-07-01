import 'package:ballkkaye_frontend/ui/pages/mypage/mypage_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "boardListBtn", // Hero 중복 방지
            onPressed: () {
              Navigator.pushNamed(context, "/board/list");
            },
            child: Icon(Icons.list),
          ),
          const SizedBox(height: 12),
          FloatingActionButton.extended(
            heroTag: "mypageBtn",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MypagePage()),
              );
            },
            label: Text("마이페이지"),
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}
