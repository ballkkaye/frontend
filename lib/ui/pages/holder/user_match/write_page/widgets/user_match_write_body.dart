import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'user_match_write_calendar_bottom_sheet.dart';
import 'user_match_write_select_button.dart';

class UserMatchWriteBody extends StatefulWidget {
  const UserMatchWriteBody({super.key});

  @override
  State<UserMatchWriteBody> createState() => _UserMatchWriteBodyState();
}

class _UserMatchWriteBodyState extends State<UserMatchWriteBody> {
  DateTime? selectedDate;
  String? selectedMatch;

  final List<String> matches = [
    '롯데 자이언츠 vs 두산 베어스',
    '롯데 자이언츠 vs LG 트윈스',
    '롯데 자이언츠 vs 한화 이글스',
    '롯데 자이언츠 vs 삼성 라이온즈',
    '롯데 자이언츠 vs NC 다이노스',
  ];

  @override
  Widget build(BuildContext context) {
    print('🔁 UserMatchWriteBody build 실행됨');
    print('📅 selectedDate 상태: $selectedDate');

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('날짜 선택', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () async {
              final picked = await showModalBottomSheet<DateTime>(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                builder: (context) => CalendarBottomSheet(
                  onDateSelected: (date) {
                    Navigator.pop(context, date);
                  },
                ),
              );

              if (picked != null) {
                setState(() {
                  selectedDate = picked;
                  selectedMatch = null; // 날짜 바뀌면 경기 초기화
                });
                print('✅ 선택된 날짜: $picked');
              } else {
                print('❗ 날짜 선택 안 하고 닫힘');
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    selectedDate != null ? DateFormat('yyyy.MM.dd').format(selectedDate!) : '날짜 선택',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          if (selectedDate != null) ...[
            const SizedBox(height: 24),
            const Text('경기 선택', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            SelectButton(
              hintText: '경기',
              options: matches,
              onChanged: (value) {
                setState(() {
                  selectedMatch = value;
                  print('⚾ selectedMatch 변경됨: $selectedMatch');
                });
              },
            ),
          ],
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (selectedMatch != null)
                  ? () {
                      print('✅ 다음으로 이동: 날짜 $selectedDate, 경기 $selectedMatch');
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              child: const Text('다음'),
            ),
          ),
        ],
      ),
    );
  }
}
