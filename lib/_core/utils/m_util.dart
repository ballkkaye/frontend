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
