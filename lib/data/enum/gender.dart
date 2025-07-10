enum Gender {
  MALE("남성"),
  FEMALE("여성"),
  NONE("무관");

  final String label;

  const Gender(this.label);

  @override
  String toString() => label;

  static Gender fromLabel(String label) {
    return Gender.values.firstWhere(
      (g) => g.label == label,
      orElse: () => Gender.NONE,
    );
  }
}
