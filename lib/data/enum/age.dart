enum Age {
  UNDER_20("~20대"),
  FROM_20_TO_30("20~30대"),
  FROM_30_TO_40("30~40대"),
  OVER_40("40대 이상"),
  NONE("연령 무관");

  final String label;

  const Age(this.label);

  @override
  String toString() => label;

  static Age fromLabel(String label) {
    return Age.values.firstWhere(
      (e) => e.label == label,
      orElse: () => Age.NONE,
    );
  }
}
