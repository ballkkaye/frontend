import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/data/gvm/session_gvm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionModel? model = ref.watch(sessionProvider);
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: _appbar(context, model),
        body: HomeBody(),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.pushNamed(context, "/board/list");
        //   },
        // ),
      );
    }
  }

  AppBar _appbar(BuildContext context, SessionModel model) {
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
              child: model.user?.profileUrl != null
                  ? Image.network(
                      model.user!.profileUrl!,
                      fit: BoxFit.cover,
                    )
                  : Center(child: MIcon.page.mypage.userDummy),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
