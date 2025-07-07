import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/gvm/session_gvm.dart';
import 'package:ballkkaye_frontend/ui/pages/auth/join_page/join_fm.dart';
import 'package:ballkkaye_frontend/ui/pages/auth/join_page/join_team_vm.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_dropdown_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinTeamForm extends ConsumerWidget {
  const JoinTeamForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    JoinTeamModel? joinTeamModel = ref.watch(joinTeamProvider);
    JoinModel joinModel = ref.read(joinProvider);
    JoinFM fm = ref.read(joinProvider.notifier);
    SessionGVM gvm = ref.watch(sessionProvider.notifier);

    if (joinTeamModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MText.h3_6('응원팀을 선택해주세요', color: MColor.kLabel.normal),
            SizedBox(height: 12),
            MDropdownBtn(
              hintText: '응원팀 선택',
              items: joinTeamModel.teams,
              itemLabel: (team) => team.label,
              onChanged: (team) {
                if (team != null) {
                  fm.teamId(team.id!);
                }
              },
            ),
            Spacer(),
            MElevatedBtn(
              text: '완료',
              onPressed: () {
                gvm.writeAdditionalInfo(joinModel);
              },
            ),
          ],
        ),
      );
    }
  }
}
