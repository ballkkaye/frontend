import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// 오늘 날짜 (시, 분, 초 0으로 초기화된 날짜)
DateTime get today => DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

/// DateTime → "yyyy-MM-dd" 문자열로 반환 (시, 분, 초 제거)
String formatDateToStr(DateTime dateTime) {
  DateTime date = DateTime(dateTime.year, dateTime.month, dateTime.day);
  String year = date.year.toString();
  String month = date.month.toString().padLeft(2, '0');
  String day = date.day.toString().padLeft(2, '0');

  return "$year-$month-$day";
}

/// `DateTime`을 'yyyy-MM-dd' 형식의 문자열로 변환
String formatDateToYMD(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}

/// dash로 구분된 날짜 형식 dot로 구분된 날짜 형식으로 변환
String formatToDotDate(String dashDate) {
  // "2025-07-10" → "2025.07.10"
  return dashDate.replaceAll("-", ".");
}

/// "18:30" → TimeOfDay
TimeOfDay parseGameTime(String timeStr) {
  final parts = timeStr.split(':');
  final hour = int.tryParse(parts[0]) ?? 0;
  final minute = int.tryParse(parts[1]) ?? 0;
  return TimeOfDay(hour: hour, minute: minute);
}

/// TimeOfDay → "18:30"
String formatGameTime(TimeOfDay time) {
  final hour = time.hour.toString().padLeft(2, '0');
  final minute = time.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}

/// "2025-07-25" -> "2025-07"
String extractYearMonth(String fullDate) {
  final dt = DateTime.parse(fullDate);
  return '${dt.year.toString().padLeft(4, '0')}-${dt.month.toString().padLeft(2, '0')}';
}
