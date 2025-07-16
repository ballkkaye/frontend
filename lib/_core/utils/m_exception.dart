class MException implements Exception {
  final String message;
  final Object? cause;

  MException({
    required this.message,
    this.cause,
  });

  @override
  String toString() {
    return 'MException: $message, cause=$cause';
  }
}
