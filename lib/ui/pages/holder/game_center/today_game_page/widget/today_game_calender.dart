import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayGameCalender extends StatefulWidget {
  const TodayGameCalender({super.key});

  @override
  State<TodayGameCalender> createState() => _TodayGameCalenderState();
}

class _TodayGameCalenderState extends State<TodayGameCalender> {
  DateTime selectedDate = DateTime.now();

  void _changeDate(int offset) {
    final newDate = selectedDate.add(Duration(days: offset));
    // 미래는 선택 불가 // TODO : 오늘의 경기는 미래 선택 가능 -> 수정 필요
    if (newDate.isAfter(DateTime.now())) return;
    setState(() {
      selectedDate = newDate;
    });
  }

  void _showDatePicker() {
    showModalBottomSheet(
      backgroundColor: MColor.kBackground.normal,
      context: context,
      builder: (context) {
        return MDatePicker(
          minimumDate: DateTime(2020, 3, 1), // TODO : 실제 서버에서 전달해주는 전체 날짜 중 첫 날짜 기준으로 변경
          maximumDate: DateTime.now(),
          onDateTimeChanged: (DateTime newDate) {
            setState(() {
              print('날짜 선택됨');
              selectedDate = newDate;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy.MM.dd(E)', 'ko_KR').format(selectedDate);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () => _changeDate(-1),
          ),
          GestureDetector(
            onTap: _showDatePicker,
            child: Row(
              children: [
                MText.normal4_6(
                  formattedDate,
                  color: MColor.kLabel.normal,
                ),
                SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Icon(Icons.arrow_drop_down),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: selectedDate.isBefore(DateTime.now()) ? () => _changeDate(1) : null,
            color: selectedDate.isBefore(DateTime.now()) ? null : Colors.grey,
          ),
        ],
      ),
    );
  }
}
