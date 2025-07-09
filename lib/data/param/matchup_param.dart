class MatchupParam {
  // 두개의 아이디를 쿼리스트링으로 가져와야해서 그 둘을 묶는 class 필요
  final int gameId;
  final int teamId;

  MatchupParam({required this.gameId, required this.teamId});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is MatchupParam && runtimeType == other.runtimeType && gameId == other.gameId && teamId == other.teamId;

  @override
  int get hashCode => gameId.hashCode ^ teamId.hashCode;
}
