/// 오늘 날짜 (시, 분, 초 0으로 초기화된 날짜)
DateTime get today => DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
