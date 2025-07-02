import 'package:ballkkaye_frontend/_core/utils/m_util.dart';
import 'package:flutter/cupertino.dart';

class MDatePicker extends StatelessWidget {
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final void Function(DateTime) onDateTimeChanged;

  const MDatePicker({
    super.key,
    required this.minimumDate,
    required this.maximumDate,
    required this.onDateTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        initialDateTime:
            today, // maximumDate에 DataTime.now()가 들어오면 initialDateTime이 microseconds 단위에서 앞서는 경우 예방
        minimumDate: minimumDate,
        maximumDate: maximumDate,
        onDateTimeChanged: onDateTimeChanged,
      ),
    );
  }
}
