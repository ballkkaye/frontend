import 'package:ballkkaye_frontend/_core/utils/m_util.dart';
import 'package:ballkkaye_frontend/data/repository/visit_record_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 두가지 데이터 상태를 각각 업데이트 하기 위한 상태관리 class
class VisitRecordSelectState {
  final String? selectedDate;
  final String? selectedGame;
  final int? selectedGameId;
  final List<VisitRecordGame>? gameList;
  final List<VisitRecordHasGameDay>? hasGameDayList;

  VisitRecordSelectState({
    this.selectedDate,
    this.selectedGame,
    this.selectedGameId,
    this.gameList,
    this.hasGameDayList,
  });

  VisitRecordSelectState copyWith({
    String? selectedDate,
    String? selectedGame,
    int? selectedGameId,
    List<VisitRecordGame>? gameList,
    List<VisitRecordHasGameDay>? hasGameDayList,
  }) {
    return VisitRecordSelectState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedGame: selectedGame ?? this.selectedGame,
      selectedGameId: selectedGameId ?? this.selectedGameId,
      gameList: gameList ?? this.gameList,
      hasGameDayList: hasGameDayList ?? this.hasGameDayList,
    );
  }
}

final visitRecordSelectProvider = AutoDisposeNotifierProvider<VisitRecordSelectVM, VisitRecordSelectState>(
  VisitRecordSelectVM.new,
);

class VisitRecordSelectVM extends AutoDisposeNotifier<VisitRecordSelectState> {
  final mContext = navigatorKey.currentContext!;

  @override
  VisitRecordSelectState build() => VisitRecordSelectState();

  void updateSelectedDate(String date) {
    state = state.copyWith(selectedDate: date);
    loadGameList(date); // 날짜에 따른 경기 목록 비동기 호출
  }

  void updateSelectedGame(int gameId, String label) {
    state = state.copyWith(
      selectedGameId: gameId,
      selectedGame: label,
    );
  }

  Future<void> loadGameList(String date) async {
    final body = await VisitRecordRepository().getGameList(date);
    final games = body["body"]["games"];
    final formattedDate = formatToDotDate(date);
    final matchedList = games.where((g) => g["gameDate"].toString().startsWith(formattedDate)).toList();

    if (body["status"] != 200) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("경기 목록 조회 실패: ${body['errorMessage']}")),
      );
      return;
    }

    if (matchedList.isEmpty) {
      print("해당 날짜에 경기가 없습니다.");
      state = state.copyWith(gameList: []);
      return;
    }

    final matched = matchedList.first;
    final items = matched["items"];
    final list = (items as List).map((e) => VisitRecordGame.fromMap(e)).toList();

    state = state.copyWith(gameList: list);
  }

  Future<void> loadHasGameDay(String yearMonth) async {
    final body = await VisitRecordRepository().getHasGameDay(yearMonth);
    if (body["status"] != 200) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("경기 유무 확인 실패: ${body['errorMessage']}")),
      );
      return;
    }

    final list = (body["body"] as List).map((e) => VisitRecordHasGameDay.fromMap(e)).toList();

    state = state.copyWith(hasGameDayList: list);
  }

  // 날짜에 경기가 있는지 판별해주는 메서드
  bool isGameAvailableOnSelectedDate() {
    if (state.selectedDate == null || state.hasGameDayList == null) return false;

    final parts = state.selectedDate!.split('-'); // [yyyy, MM, dd]
    if (parts.length != 3) return false;

    final year = parts[0];
    final month = parts[1];
    final day = parts[2];

    final yearData = state.hasGameDayList!.firstWhere(
      (y) => y.year == year,
      orElse: () => VisitRecordHasGameDay(year: year, monthDTO: []),
    );

    final monthData = yearData.monthDTO.firstWhere(
      (m) => m.month == month,
      orElse: () => MonthDTO(month: month, day: []),
    );

    final dayData = monthData.day.firstWhere(
      (d) => d.day == day,
      orElse: () => DayDTO(day: day, isHaveGame: false),
    );

    return dayData.isHaveGame;
  }
}

class VisitRecordGame {
  final int gameId;
  final String homeTeamFullName;
  final String homeTeamShortName;
  final int homeTeamScore;
  final String awayTeamFullName;
  final String awayTeamShortName;
  final int awayTeamScore;
  final String stadiumFullName;
  final String stadiumShortName;
  final String gameDate;

  VisitRecordGame({
    required this.gameId,
    required this.homeTeamFullName,
    required this.homeTeamShortName,
    required this.homeTeamScore,
    required this.awayTeamFullName,
    required this.awayTeamShortName,
    required this.awayTeamScore,
    required this.stadiumFullName,
    required this.stadiumShortName,
    required this.gameDate,
  });

  String get gameName => '$awayTeamFullName vs $homeTeamFullName ($stadiumShortName)';

  factory VisitRecordGame.fromMap(Map<String, dynamic> map) {
    return VisitRecordGame(
      gameId: map['gameId'],
      homeTeamFullName: map['homeTeamFullName'],
      homeTeamShortName: map['homeTeamShortName'],
      homeTeamScore: map['homeTeamScore'],
      awayTeamFullName: map['awayTeamFullName'],
      awayTeamShortName: map['awayTeamShortName'],
      awayTeamScore: map['awayTeamScore'],
      stadiumFullName: map['stadiumFullName'],
      stadiumShortName: map['stadiumShortName'],
      gameDate: map['gameDate'],
    );
  }

  @override
  String toString() => 'VisitRecordGame(gameId: $gameId)';
}

class VisitRecordHasGameDay {
  final String year;
  final List<MonthDTO> monthDTO;

  VisitRecordHasGameDay({
    required this.year,
    required this.monthDTO,
  });

  factory VisitRecordHasGameDay.fromMap(Map<String, dynamic> map) {
    return VisitRecordHasGameDay(
      year: map['year'],
      monthDTO: List<MonthDTO>.from(
        (map['monthDTO'] as List).map((e) => MonthDTO.fromMap(e)),
      ),
    );
  }
}

class MonthDTO {
  final String month;
  final List<DayDTO> day;

  MonthDTO({
    required this.month,
    required this.day,
  });

  factory MonthDTO.fromMap(Map<String, dynamic> map) {
    return MonthDTO(
      month: map['month'],
      day: List<DayDTO>.from(
        (map['day'] as List).map((e) => DayDTO.fromMap(e)),
      ),
    );
  }
}

class DayDTO {
  final String day;
  final bool isHaveGame;

  DayDTO({
    required this.day,
    required this.isHaveGame,
  });

  factory DayDTO.fromMap(Map<String, dynamic> map) {
    return DayDTO(
      day: map['day'],
      isHaveGame: map['isHaveGame'],
    );
  }
}
