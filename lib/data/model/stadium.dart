class Stadium {
  final int? stadiumId;
  final String? stadiumName;

  Stadium({
    this.stadiumId,
    this.stadiumName,
  });

  factory Stadium.fromMap(Map<String, dynamic> data) {
    return Stadium(
      stadiumId: data['stadiumId'],
      stadiumName: data['stadiumName'],
    );
  }

  @override
  String toString() {
    return 'Stadium(stadiumId: $stadiumId, stadiumName: $stadiumName)';
  }
}
