class VisitRecordParam {
  final int year;
  final int month;

  VisitRecordParam({
    required this.year,
    required this.month,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is VisitRecordParam && runtimeType == other.runtimeType && year == other.year && month == other.month;

  @override
  int get hashCode => year.hashCode ^ month.hashCode;
}
