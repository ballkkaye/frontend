import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/enum/age.dart';
import 'package:ballkkaye_frontend/data/enum/gender.dart';
import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/data/model/team.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/user_match_list_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/write_page/user_match_write_fm.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_dropdown_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_tag.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_text_form_field.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_toggle_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class UserMatchWriteForm extends ConsumerStatefulWidget {
  Game selectedGame;

  UserMatchWriteForm({super.key, required this.selectedGame});

  @override
  ConsumerState<UserMatchWriteForm> createState() => _UserMatchWriteFormState();
}

class _UserMatchWriteFormState extends ConsumerState<UserMatchWriteForm> {
  String selectedGenderLabel = "";
  bool _isSameTeam = false;

  @override
  Widget build(BuildContext context) {
    UserMatchWriteFM fm = ref.read(userMatchWriteProvider.notifier);
    UserMatchWriteModel writeModel = ref.watch(userMatchWriteProvider);
    UserMatchListVM vm = ref.read(userMatchListProvider.notifier);

    List<Team> teamOptions = [
      widget.selectedGame.homeTeam,
      widget.selectedGame.awayTeam,
    ];

    Team? selectedTeam;
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 경기 일정 태그
          Center(
            child: MTag(
              label:
                  '${widget.selectedGame.gameDate} ${widget.selectedGame.awayTeam.fullName} vs ${widget.selectedGame.homeTeam.fullName} (${widget.selectedGame.stadiumShotrName})',
              fillColor: MColor.kFill.normal,
              textColor: MColor.kLabel.normal,
            ),
          ),
          SizedBox(height: 12),

          // 희망 응원팀
          Row(
            children: [
              MText.h3_6('희망 응원팀', color: MColor.kLabel.normal),
              Padding(
                padding: EdgeInsetsGeometry.directional(top: 1, start: 10),
                child: Transform.scale(
                  scale: 0.96,
                  child: Checkbox(
                    value: _isSameTeam,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    fillColor: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.selected)) {
                        return MColor.kPrimary.strong;
                      }
                    }),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _isSameTeam = value;
                        });
                        fm.isSameTeam(value);
                        Logger().d("같은 팀이면 좋겠어요 선택: $_isSameTeam");
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.directional(bottom: 0),
                child: MText.label1_5('같은 팀이면 좋겠어요', color: MColor.kPrimary.strong),
              )
            ],
          ),
          SizedBox(height: 6),
          MDropdownBtn<Team>(
            hintText: '응원팀',
            items: teamOptions,
            itemLabel: (team) => team.fullName ?? '',
            value: selectedTeam,
            onChanged: (team) {
              if (team != null && team.teamId != null) {
                fm.teamId(team.teamId!);
                setState(() {
                  selectedTeam = team;
                });
                Logger().d("응원팀 선택: ${team.fullName}, ID: ${team.teamId}");
              }
            },
          ),
          SizedBox(height: 12),

          // 희망 연령
          MText.h3_6('희망 연령', color: MColor.kLabel.normal),
          SizedBox(height: 6),
          MDropdownBtn(
            hintText: '연령',
            items: Age.values,
            itemLabel: (a) => a.label,
            onChanged: (value) {
              if (value != null) {
                fm.preferredAge(value.name);
                Logger().d("연령 버튼 선택 : ${value.name}");
              }
            },
          ),
          SizedBox(height: 12),

          // 희망 성별
          MText.h3_6('희망 성별', color: MColor.kLabel.normal),
          SizedBox(height: 6),
          MToggleBtn(
            options: Gender.values.map((g) => g.label).toList(),
            selectedValue: selectedGenderLabel,
            onSelected: (label) {
              fm.preferredGender(Gender.fromLabel(label).name);
              setState(() {
                selectedGenderLabel = label;
              });
              Logger().d("성별 버튼 선택 : ${Gender.fromLabel(label).name}");
            },
          ),

          SizedBox(height: 12),

          // 동행글 제목
          MText.h3_6('모집글 작성', color: MColor.kLabel.normal),
          SizedBox(height: 6),
          MTextFormField(
            hintText: '제목',
            onChanged: (value) {
              fm.title(value);
              Logger().d("제목 : ${value}");
            },
          ),
          SizedBox(height: 6),
          // 동행글 내용
          MTextFormField(
            hintText: '글 내용',
            maxLines: 10,
            isDense: false,
            onChanged: (value) {
              fm.content(value);
              Logger().d("내용 : ${value}");
            },
          ),
          SizedBox(height: 12),

          // 채팅방 인원
          MText.h3_6('채팅방 인원', color: MColor.kLabel.normal),
          SizedBox(height: 6),
          MTextFormField(
            hintText: '인원 수',
            keyboardType: TextInputType.number,
            onChanged: (value) {
              final parsed = int.tryParse(value);
              if (parsed != null) {
                fm.maxParticipants(parsed);
                Logger().d("채팅방 인원 : ${parsed}");
              }
            },
          ),
          SizedBox(height: 12),

          // 작성 완료 버튼
          MElevatedBtn(
            text: '완료',
            onPressed: () {
              vm.write(writeModel);
            },
          ),
        ],
      ),
    );
  }
}
