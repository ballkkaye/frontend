import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/gvm/session_gvm.dart';
import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/visit_record_list_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/visit_record_write_fm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/visit_record_write_body.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userTeamId = ref.read(sessionProvider).user?.teamId ?? 0;

      if (userTeamId != 0) {
        ref.read(visitRecordWriteProvider.notifier).initTeamId(userTeamId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    VisitRecordWriteFM fm = ref.read(visitRecordWriteProvider.notifier);
    VisitRecordListVM vm = ref.read(visitRecordListProvider.notifier);
    VisitRecordWriteModel model = ref.watch(visitRecordWriteProvider);

    return Scaffold(
      appBar: _appbar(),
      body: VisitRecordWriteBody(selectedGame: widget.selectedGame),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: MElevatedBtn(
          text: '완료',
          onPressed: () {
            // fm.gameId(widget.selectedGame.gameId!);
            // vm.writeVisitRecord(
            //   fm.gameId,
            //   fm.teamId,
            //   fm.result,
            //   fm.content,
            //   fm.imgUrl,
            // );

            // fm.gameId(widget.selectedGame.gameId!);
            // fm.teamId;
            // fm.result;
            // fm.content;
            // fm.imgUrl;

            fm.gameId(widget.selectedGame.gameId!);

            final model = ref.read(visitRecordWriteProvider);

            Logger().d("📦 작성 모델: $model");
            Logger().d("📌 게임 ID: ${model.gameId}");
            Logger().d("📌 팀 ID: ${model.teamId}");
            Logger().d("📌 결과: ${model.result}");
            Logger().d("📌 내용: ${model.content}");
            Logger().d("📌 이미지 URL: ${model.imgUrl}");

            // 4. 작성 요청
            vm.writeVisitRecord(model);

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
