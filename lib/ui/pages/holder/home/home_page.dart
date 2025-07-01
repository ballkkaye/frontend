import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/mypage_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MypagePage()),
              );
            },
            child: ClipOval(
              child: Container(
                width: 30,
                height: 30,
                color: Colors.grey.shade300,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 21,
                    height: 21,
                    child: MIcon.page.mypage.userDummy,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/board/list");
        },
      ),
    );
  }
}
