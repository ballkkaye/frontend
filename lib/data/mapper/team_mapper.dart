class TeamMapper {
  static const Map<int, String> _teamMap = {
    1: "LG 트윈스",
    2: "두산 베어스",
    3: "키움 히어로즈",
    4: "SSG 랜더스",
    5: "KIA 타이거즈",
    6: "삼성 라이온즈",
    7: "롯데 자이언츠",
    8: "한화 이글스",
    9: "NC 다이노스",
    10: "KT 위즈",
  };

  // ID로 이름 반환 (없으면 null)
  static String? getName(int? id) => _teamMap[id];

  // 이름으로 ID 반환 (없으면 null)
  static int? getId(String? name) {
    if (name == null) return null;
    return _teamMap.entries
        .firstWhere((e) => e.value == name, orElse: () => const MapEntry(-1, ''))
        .key;
  }

  // 전체 리스트
  static List<MapEntry<int, String>> get teamList => _teamMap.entries.toList();
}
