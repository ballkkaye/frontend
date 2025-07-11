import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/_core/utils/m_util.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/select_page/visit_record_select_vm.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_date_picker.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_dropdown_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VisitRecordSelectBody extends ConsumerWidget {
  VisitRecordSelectBody({super.key});

  // List<String> games = [
  //   '두산 베어스 vs 롯데 자이언츠 (사직)',
  //   'SSG 랜더스 vs LG 트윈스 (잠실)',
  //   '삼성 라이온즈 vs 기아 타이거즈 (광주)',
  //   'KT 위즈 vs 한화 이글스 (대전)',
  //   'NC 다이노스 vs 키움 히어로즈 (고척)'
  // ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(visitRecordSelectProvider);
    final vm = ref.read(visitRecordSelectProvider.notifier);

    final labelToGameIdMap = {
      for (var e in state.gameList ?? []) '${e.awayTeamFullName} vs ${e.homeTeamFullName} (${e.stadiumShortName})': e.gameId.toString(),
    };

    print("게임 리스트: ${state.gameList}");

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 22, horizontal: 16),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MText.h3_6("날짜 선택"),
            SizedBox(height: 10),
            // 날짜 선택 버튼
            MIconBtn(
              height: 49,
              icon: MIcon.page.record.calendarBlack,
              text: state.selectedDate ?? "날짜 선택",
              textColor: MColor.kLabel.normal,
              onPressed: () {
                print("날짜 선택됨");
                // 날짜 선택 모달
                showModalBottomSheet(
                  backgroundColor: MColor.kBackground.normal,
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 250,
                      child: MDatePicker(
                        minimumDate: DateTime(2020, 3, 1),
                        maximumDate: DateTime.now(),
                        onDateTimeChanged: (value) {
                          print("선택된 날짜: $value");
                          // TODO.1 : 상태갱신 및 경기목록 조회ㅏ
                          vm.updateSelectedDate(formatDateToYMD(value));
                          vm.loadHasGameDay(formatDateToYMD(value));
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 16),
            MText.h3_6("경기 선택"),
            SizedBox(height: 10),
            // 경기 선택 버튼
            MDropdownBtn(
              hintText: '경기',
              items: labelToGameIdMap.keys.toList(), // 보이지 않는 gameId와 게임 정보 함께 들고옴.
              onChanged: (label) {
                if (label != null) {
                  final gameIdStr = labelToGameIdMap[label];
                  final selectedGameId = int.tryParse(gameIdStr ?? '');
                  print('🟡 선택된 gameId: $selectedGameId');
                  if (selectedGameId != null) {
                    vm.updateSelectedGame(selectedGameId, label);
                  }
                }
              },
              enabled: (state.gameList?.isNotEmpty ?? false),
            ),
            Spacer(),
            // 다음 버튼
            MElevatedBtn(
              text: '다음',
              onPressed: () {
                final selectedGameId = state.selectedGameId;
                Navigator.pushNamed(context, "/visit-record/write", arguments: selectedGameId);
                print('🟡 넘어가는 값: $selectedGameId');
              },
            ),
          ],
        ),
      ),
    );
  }
}
