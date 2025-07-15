import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: HomeBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/board/list");
        },
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      title: Image.asset(
        'assets/images/main_logo_kr.png',
        height: 32,
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/mypage');
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
    );
  }
}
