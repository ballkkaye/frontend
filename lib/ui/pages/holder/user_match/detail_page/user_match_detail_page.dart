import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/user_match_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/user_match_detail_body.dart';

class UserMatchDetailPage extends StatelessWidget {
  const UserMatchDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: UserMatchDetailBody(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: FloatingActionButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => UserMatchListPage()),
          );
        }),
      ),
    );
  }

  PreferredSizeWidget _appbar(BuildContext context) {
    return AppBar(
      title: Text('동행'),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.more_horiz),
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                actions: [
                  CupertinoActionSheetAction(
                    child: Text('수정하기', style: TextStyle(color: Colors.teal)),
                    onPressed: () {
                      Navigator.pop(context);
                      // 수정 로직
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: Text('삭제하기'),
                    isDestructiveAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                      // 삭제 로직
                    },
                  ),
                ],
                cancelButton: CupertinoActionSheetAction(
                  child: Text('취소', style: TextStyle(color: Colors.grey)),
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
        ),
        SizedBox(width: 16),
      ],
      elevation: 0,
    );
  }
}
