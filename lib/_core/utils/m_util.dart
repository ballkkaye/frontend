/// 오늘 날짜 (시, 분, 초 0으로 초기화된 날짜)
DateTime get today => DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

/// 주어진 나이 문자열("20~30대")을 "20대 이상" 형태로 변환
// String formatAgeRange(String ageRange) {
//   final match = RegExp(r'^(\d{1,2})~\d{1,2}대$').firstMatch(ageRange);
//   if (match != null) {
//     final startAge = match.group(1);
//     return '${startAge}대 이상';
//   } else {
//     return ageRange; // 형식이 맞지 않으면 원본 반환
//   }
// }
