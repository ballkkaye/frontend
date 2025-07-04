import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/widgets/list_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardListPage extends ConsumerWidget {
  const BoardListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const accessToken =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhY2Nlc3MtdG9rZW4iLCJuaWNrbmFtZSI6InNzYXIiLCJ1c2Vycm9sZSI6IlVTRVIiLCJpZCI6MSwiZXhwIjoxNzUxNjAxOTQ3fQ.7KkWIl3yTXNhSV390lXQ5yXKBnwNBiHGQlChf6HMBJ--7WM7PE2S9h2dgOaD9MhgnsZujvTkIMAds3GZ4UY5Rg";

    return Scaffold(
      appBar: _appbar(),
      floatingActionButton: _floatingActionButton(context),
      body: BoardListBody(accessToken: accessToken),
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, "/board/write");
      },
      shape: CircleBorder(),
      backgroundColor: MColor.kPrimary.strong,
      foregroundColor: Colors.white,
      child: MIcon.page.community.write,
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: MText.h1("커뮤니티"),
      centerTitle: true,
    );
  }
}
