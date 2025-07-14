enum Result {
  WIN("승"),
  TIE("무"),
  LOSE("패");

  final String label;

  const Result(this.label);

  @override
  String toString() => label;

  static Result fromLabel(String label) {
    return Result.values.firstWhere(
      (g) => g.label == label,
    );
  }
}
