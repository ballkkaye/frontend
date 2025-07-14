import 'package:ballkkaye_frontend/_core/utils/m_util.dart';
import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:ballkkaye_frontend/data/repository/visit_record_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 두가지 데이터 상태를 각각 업데이트 하기 위한 상태관리 class
class VisitRecordSelectState {
  final String? selectedDate;
  final String? selectedGame;
  final VisitRecord? selectedGameInfo;
  final List<VisitRecord>? gameList;
  final List<VisitRecordHasGameDay>? hasGameDayList;

  VisitRecordSelectState({
    this.selectedDate,
    this.selectedGame,
    this.selectedGameInfo,
    this.gameList,
    this.hasGameDayList,
  });

  VisitRecordSelectState copyWith({
    String? selectedDate,
    String? selectedGame,
    VisitRecord? selectedGameInfo,
    List<VisitRecord>? gameList,
    List<VisitRecordHasGameDay>? hasGameDayList,
  }) {
    return VisitRecordSelectState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedGame: selectedGame ?? this.selectedGame,
      selectedGameInfo: selectedGameInfo ?? this.selectedGameInfo,
      gameList: gameList ?? this.gameList,
      hasGameDayList: hasGameDayList ?? this.hasGameDayList,
    );
  }
}

final visitRecordSelectProvider =
    AutoDisposeNotifierProvider<VisitRecordSelectVM, VisitRecordSelectState>(
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

  void updateSelectedGame(VisitRecord selectedinfo, String label) {
    state = state.copyWith(
      selectedGameInfo: selectedinfo,
      selectedGame: label,
    );
  }

  Future<void> loadGameList(String date) async {
    final body = await VisitRecordRepository().getGameList(date);

    if (body["status"] != 200) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("경기 목록 조회 실패: ${body['errorMessage']}")),
      );
    }

    final formattedDate = formatToDotDate(date);
    final games = List<Map<String, dynamic>>.from(body["body"]["games"]);

    final matchedGroup = games.firstWhere(
      (g) => g["gameDate"] == formattedDate,
      orElse: () => {},
    );

    if (matchedGroup.isEmpty) {
      state = state.copyWith(gameList: []);
    }

    final items = List<Map<String, dynamic>>.from(matchedGroup["items"] ?? []);
    final list = items.map((e) => VisitRecord.fromMap(e)).toList();

    state = state.copyWith(gameList: list);
    print("${list}");
    return;
  }

  Future<void> loadHasGameDay(String yearMonth) async {
    final body = await VisitRecordRepository().getHasGameDay(yearMonth);
    if (body["status"] != 200) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("경기 유무 확인 실패: ${body['errorMessage']}")),
      );
      return;
    }

    final list = (body["body"] as List)
        .map((e) => VisitRecordHasGameDay.fromMap(e))
        .toList();

    state = state.copyWith(hasGameDayList: list);
  }

  // 날짜에 경기가 있는지 판별해주는 메서드
  bool isGameAvailableOnSelectedDate() {
    if (state.selectedDate == null || state.hasGameDayList == null)
      return false;

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
