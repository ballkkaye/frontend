import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/visit_record_list_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/visit_record_write_fm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/visit_record_write_body.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VisitRecordWritePage extends ConsumerStatefulWidget {
  final VisitRecord selectedGame;
  const VisitRecordWritePage({
    super.key,
    required this.selectedGame,
  });

  @override
  ConsumerState<VisitRecordWritePage> createState() => _VisitRecordWritePageState();
}

class _VisitRecordWritePageState extends ConsumerState<VisitRecordWritePage> {
  @override
  Widget build(BuildContext context) {
    final writeModel = ref.read(visitRecordWriteProvider.notifier);
    final listModel = ref.read(visitRecordListProvider.notifier);

    return Scaffold(
      appBar: _appbar(),
      body: VisitRecordWriteBody(selectedGame: widget.selectedGame),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: MElevatedBtn(
          text: '완료',
          onPressed: () {
            writeModel.gameId(widget.selectedGame.gameId!);
            writeModel.teamId;

            final writeProvider = ref.read(visitRecordWriteProvider);

            print("📦 작성 모델: $writeProvider");
            print("  - 게임 ID: ${writeProvider.gameId}");
            print("  - 팀 ID: ${writeProvider.teamId}");
            print("  - 결과: ${writeProvider.result}");
            print("  - 내용: ${writeProvider.content}");
            print("  - 이미지 URL: ${writeProvider.imgUrl}");

            // 4. 작성 요청
            listModel.writeVisitRecord(writeProvider);

            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      centerTitle: true,
      title: MText.h1('기록 작성', color: MColor.kLabel.normal),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    );
  }
}
