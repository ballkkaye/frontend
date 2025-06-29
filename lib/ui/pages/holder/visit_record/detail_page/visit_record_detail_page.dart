import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/detail_page/widgets/detail_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VisitRecordDetailPage extends StatelessWidget {
  const VisitRecordDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: DetailBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/visit-record/write");
        },
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      title: MText.h1("직관 기록"),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return Container(
                  child: CupertinoActionSheet(
                    actions: [
                      CupertinoButton(
                        child: Text(
                          '수정하기',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                      ),
                      CupertinoButton(
                        child: Text(
                          '삭제하기',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                      ),
                    ],
                    cancelButton: CupertinoButton(
                      child: Text(
                        '취소',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              },
            );
          }, // TODO : 버튼 수정
          icon: MIcon.nav.top.dotHorizontal,
        ),
      ],
    );
  }
}
