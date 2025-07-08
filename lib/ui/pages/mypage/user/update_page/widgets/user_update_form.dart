import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/gvm/session_gvm.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/user/update_page/user_update_fm.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/user/update_page/user_update_team_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/user/update_page/widgets/user_update_profile_img_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_dropdown_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class UserUpdateForm extends ConsumerWidget {
  const UserUpdateForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserUpdateTeamModel? userUpdateTeamModel = ref.watch(userUpdateTeamProvider);
    UserUpdateFM fm = ref.read(userUpdateProvider.notifier);
    UserUpdateModel userUpdateModel = ref.watch(userUpdateProvider);
    SessionGVM gvm = ref.watch(sessionProvider.notifier);
    SessionModel model = ref.watch(sessionProvider);

    if (userUpdateTeamModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Form(
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: EdgeInsetsGeometry.directional(start: 14, end: 14, top: 30, bottom: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 프로필 사진 수정 버튼
                    UserUpdateProfileImgBtn(), // TODO : image_picker로 프로필 사진 수정
                    SizedBox(height: 20),

                    // 닉네임 수정
                    MText.normal6_5('닉네임', color: MColor.kLabel.normal),
                    SizedBox(height: 6),
                    MTextFormField(
                      hintText: '닉네임',
                      initialValue: '${model.user!.nickname}',
                      onChanged: (value) {
                        fm.nickname(value);
                      },
                    ),
                    SizedBox(height: 12),

                    // 응원팀 수정
                    MText.normal6_5('내 응원팀', color: MColor.kLabel.normal),
                    SizedBox(height: 6),
                    MDropdownBtn(
                      hintText: '응원팀 선택',
                      items: userUpdateTeamModel.teams,
                      itemLabel: (team) => team.label,
                      onChanged: (team) {
                        if (team != null && team.id != null) {
                          fm.teamId(team.id!);
                          Logger().d("유저 수정 - 선택된 teamId: ${team.id}");
                        }
                      },
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            // 수정 완료 버튼
            Spacer(),
            MElevatedBtn(
              text: '수정',
              onPressed: () {
                gvm.update(userUpdateModel);
              },
            ),
          ],
        ),
      );
    }
  }
}
