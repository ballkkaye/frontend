Map<String, int> parseHourMinute(String? timeStr) {
  if (timeStr == null || !timeStr.contains(":")) {
    return {"hour": 0, "minute": 0};
  }
  final parts = timeStr.split(":");
  return {
    "hour": int.tryParse(parts[0]) ?? 0,
    "minute": int.tryParse(parts[1]) ?? 0,
  };
}

String formatTime(int hour, int minute) {
  final h = hour.toString().padLeft(2, '0');
  final m = minute.toString().padLeft(2, '0');
  return "$h:$m";
}
