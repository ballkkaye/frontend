import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'write_calendar_bottom_sheet.dart';
import 'write_select_button.dart';

class WriteBody extends StatefulWidget {
  const WriteBody({super.key});

  @override
  State<WriteBody> createState() => _WriteBodyState();
}

class _WriteBodyState extends State<WriteBody> {
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
                builder: (context) => WriteCalendarBottomSheet(
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
              } else {}
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
                    selectedDate != null
                        ? DateFormat('yyyy.MM.dd').format(selectedDate!)
                        : '날짜 선택',
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
            WriteSelectButton(
              hintText: '경기',
              options: matches,
              onChanged: (value) {
                setState(() {
                  selectedMatch = value;
                });
              },
            ),
          ],
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (selectedMatch != null) ? () {} : null,
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
