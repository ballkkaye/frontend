import 'package:flutter/cupertino.dart';
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
    // 미래는 선택 불가
    if (newDate.isAfter(DateTime.now())) return;
    setState(() {
      selectedDate = newDate;
    });
  }

  void _showDatePicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 250,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: selectedDate,
            maximumDate: DateTime.now(),
            onDateTimeChanged: (DateTime newDate) {
              setState(() {
                print('날짜 선택됨');
                selectedDate = newDate;
              });
            },
          ),
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
                Text(
                  formattedDate,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
