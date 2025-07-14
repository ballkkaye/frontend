import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/_core/utils/m_util.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/select_page/user_match_select_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/select_page/widgets/user_match_select_dropdown_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_date_select_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserMatchSelectBody extends ConsumerStatefulWidget {
  const UserMatchSelectBody({super.key});

  @override
  ConsumerState<UserMatchSelectBody> createState() => _UserMatchSelectBodyState();
}

class _UserMatchSelectBodyState extends ConsumerState<UserMatchSelectBody> {
  String selectedDate = formatDateToStr(today);

  @override
  Widget build(BuildContext context) {
    UserMatchSelectVM vm = ref.read(userMatchSelectProvider(selectedDate).notifier);

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
              minimumDate: DateTime(DateTime.now().year, 1, 1),
              maximumDate: DateTime(DateTime.now().year + 1, 1, 0),
              onDateTimeChanged: (date) {
                setState(() {
                  selectedDate = formatDateToStr(date);
                });
                vm.getAvailableDate(formatDateToStr(date));
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
