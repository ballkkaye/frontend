import 'package:intl/intl.dart';

/// 오늘 날짜 (시, 분, 초 0으로 초기화된 날짜)
DateTime get today => DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

/// `DateTime`을 'yyyy-MM-dd' 형식의 문자열로 변환
String formatDateToYMD(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}
