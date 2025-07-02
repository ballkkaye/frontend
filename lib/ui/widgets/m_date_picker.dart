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
    // maximumDate에 DataTime.now()가 들어오면 initialDateTime이 microseconds 단위에서 앞서는 경우 예방
    DateTime initialDateTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
    return SizedBox(
      height: 250,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        initialDateTime: initialDateTime,
        minimumDate: minimumDate,
        maximumDate: maximumDate,
        onDateTimeChanged: onDateTimeChanged,
      ),
    );
  }
}
