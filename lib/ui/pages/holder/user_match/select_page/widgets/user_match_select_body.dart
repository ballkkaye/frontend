import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/_core/utils/m_util.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/select_page/user_match_select_date_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/select_page/widgets/user_match_select_dropdown_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_date_select_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class UserMatchSelectBody extends ConsumerStatefulWidget {
  const UserMatchSelectBody({super.key});

  @override
  ConsumerState<UserMatchSelectBody> createState() => _UserMatchSelectBodyState();
}

class _UserMatchSelectBodyState extends ConsumerState<UserMatchSelectBody> {
  String selectedDate = formatDateToStr(today);

  List<String> games = [
    '두산 베어스 vs 롯데 자이언츠 (사직)',
    'SSG 랜더스 vs LG 트윈스 (잠실)',
    '삼성 라이온즈 vs 기아 타이거즈 (광주)',
    'KT 위즈 vs 한화 이글스 (대전)',
    'NC 다이노스 vs 키움 히어로즈 (고척)'
  ];

  @override
  Widget build(BuildContext context) {
    UserMatchSelectDateModel? dateModel = ref.watch(userMatchSelectDateProvider);

    if (dateModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 16),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MText.h3_6("날짜 선택"),
              SizedBox(height: 10),
              // 날짜 선택 버튼
              MDateSelectBtn(
                text: selectedDate,
                minimumDate: today,
                maximumDate: dateModel.maximumDate,
                onDateTimeChanged: (value) {
                  Logger().d(dateModel.isGameDay(value));
                  if (!dateModel.isGameDay(value)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("경기가 없는 날입니다.")),
                    );
                    return;
                  }
                  setState(() {
                    selectedDate = formatDateToStr(value);
                  });
                  // formatDateToStr(value);
                  // TODO : value 날짜를 select_game_vm으로 넘겨줘야 한다.
                },
              ),
              SizedBox(height: 16),
              MText.h3_6("경기 선택"),
              SizedBox(height: 10),
              // 경기 선택 버튼
              UserMatchSelectDropdownBtn(date: selectedDate),
            ],
          ),
        ),
      );
    }
  }
}
