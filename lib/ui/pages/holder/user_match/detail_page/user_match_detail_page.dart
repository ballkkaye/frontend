import 'package:ballkkaye_frontend/_core/style/m_color.dart' show MColor;
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/detail_page/user_match_detail_vm.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_more_option_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/user_match_detail_body.dart';

class UserMatchDetailPage extends ConsumerWidget {
  final int userMatchId;

  const UserMatchDetailPage(this.userMatchId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserMatchDetailVM vm = ref.read(userMatchDetailProvider(userMatchId).notifier);

    return Scaffold(
      appBar: _appbar(context, vm),
      body: UserMatchDetailBody(userMatchId),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 210),
      //   child: FloatingActionButton(onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (_) => UserMatchWritePage()),
      //     );
      //   }),
      // ),
    );
  }

  AppBar _appbar(BuildContext context, UserMatchDetailVM vm) {
    return AppBar(
      centerTitle: true,
      title: MText.h1('동행', color: MColor.kLabel.normal),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      actions: [
        // 더보기 버튼
        MMoreOptionBtn(
          icon: MIcon.nav.top.dotHorizontal,
          onUpdate: () {
            Navigator.pushNamed(context, '/user-match/update');
          },
          alertTitle: '동행글 삭제',
          alertContent: '동행글을 삭제하시겠습니까?',
          onAlertConfirm: () {
            vm.deleteOne(userMatchId);
          },
          // 다이얼로그 닫힌 뒤 동작
          onAlertCancel: () {},
          // 다이얼로그 닫힌 뒤 동작
          alertConfirmText: '삭제',
          alertCancelText: '취소',
        ),
      ],
    );
  }
}
