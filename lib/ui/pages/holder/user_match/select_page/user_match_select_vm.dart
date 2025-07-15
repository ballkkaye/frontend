import 'package:ballkkaye_frontend/_core/utils/m_util.dart';
import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/data/repository/game_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final userMatchSelectProvider =
    AutoDisposeNotifierProvider.family<UserMatchSelectVM, UserMatchSelectModel?, String>(() {
  return UserMatchSelectVM();
});

class UserMatchSelectVM extends AutoDisposeFamilyNotifier<UserMatchSelectModel?, String> {
  final mContext = navigatorKey.currentContext!;

  @override
  UserMatchSelectModel? build(String date) {
    init(date);

    ref.onDispose(() {
      Logger().d("UserMatchSelectVM 파괴됨");
    });

    return null;
  }

  Future<void> init(String date) async {
    // games 조회
    Map<String, dynamic> gameData = await GameRepository().getList(date);
    if (gameData["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("동행글 작성 전 경기 조회 통신 실패 : ${gameData["msg"]}")),
      );
      return;
    }

    final newGames = UserMatchSelectModel.fromGameList(gameData["body"]).games;

    state = UserMatchSelectModel(games: newGames, selectedDate: date);

    // years 조회
    Map<String, dynamic> dateData =
        await GameRepository().getAvailableDateList(extractYearMonth(date));
    if (dateData["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("동행글 작성 전 날짜 조회 통신 실패 : ${dateData["msg"]}")),
      );
      return;
    }
    final newYears = UserMatchSelectModel.fromYearList(dateData["body"]).years;

    state = state!.copyWith(years: newYears);
  }

  Future<void> getAvailableDate(String date) async {
    Logger().d("년-월로 추출된 날짜 : ${extractYearMonth(date)}");
    Map<String, dynamic> data = await GameRepository().getAvailableDateList(extractYearMonth(date));
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("동행글 작성 전 날짜 조회 통신 실패 : ${data["msg"]}")),
      );
      return;
    }

    final newYears = UserMatchSelectModel.fromYearList(data["body"]).years;
    final tempState = state?.copyWith(years: newYears);

    // 날짜에 해당하는 경기가 있는지 확인
    final selectedDate = DateTime.parse(date);
    if (tempState == null || !tempState.isGameDay(selectedDate)) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("해당 날짜에는 경기가 없습니다.")),
      );
      return;
    }

    // 날짜에 경기 있음 → 게임 조회 후 상태 갱신
    Map<String, dynamic> gameData = await GameRepository().getList(date);
    if (gameData["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("경기 목록 조회 실패 : ${gameData["msg"]}")),
      );
      return;
    }

    final newGames = UserMatchSelectModel.fromGameList(gameData["body"]).games;

    // 최종 상태 갱신
    state = state!.copyWith(years: newYears, games: newGames, selectedDate: date);
  }
}

class UserMatchSelectModel {
  final List<AvailableYear>? years;
  final List<Game>? games;
  final String? selectedDate;

  UserMatchSelectModel({
    this.years,
    this.games,
    this.selectedDate,
  });

  UserMatchSelectModel.fromYearList(List<dynamic> list)
      : years = list.map((e) => AvailableYear.fromMap(e)).toList(),
        games = null,
        selectedDate = formatDateToStr(today);

  UserMatchSelectModel.fromGameList(Map<String, dynamic> map)
      : games = (map['games'] as List)
            .expand((g) => (g['items'] as List))
            .map((e) => Game.fromGameData(e))
            .toList(),
        years = null,
        selectedDate = map['selectedDate'];

  UserMatchSelectModel copyWith({
    List<AvailableYear>? years,
    List<Game>? games,
    String? selectedDate,
  }) {
    return UserMatchSelectModel(
      years: years ?? this.years,
      games: games ?? this.games,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }

  bool isGameDay(DateTime date) {
    for (final year in years!) {
      for (final month in year.months) {
        for (final day in month.days) {
          if (day.isHaveGame &&
              int.parse(year.year) == date.year &&
              int.parse(month.month) == date.month &&
              int.parse(day.day) == date.day) {
            return true;
          }
        }
      }
    }
    return false;
  }

  List<Map<String, dynamic>> formatGameList() {
    return games!.map((g) {
      return {
        'gameId': g.id,
        'game': '${g.awayTeam.fullName} vs ${g.homeTeam.fullName} (${g.stadiumShortName})',
      };
    }).toList();
  }

  @override
  String toString() {
    return 'UserMatchSelectModel{selectedDate: $selectedDate, games: ${games?.length}}';
  }
}

class AvailableYear {
  final String year;
  final List<AvailableMonth> months;

  AvailableYear.fromMap(Map<String, dynamic> data)
      : year = data['year'],
        months = (data['monthDTO'] as List).map((e) => AvailableMonth.fromMap(e)).toList();
}

class AvailableMonth {
  final String month;
  final List<AvailableDay> days;

  AvailableMonth.fromMap(Map<String, dynamic> data)
      : month = data['month'],
        days = (data['day'] as List).map((e) => AvailableDay.fromMap(e)).toList();
}

class AvailableDay {
  final String day;
  final bool isHaveGame;

  AvailableDay.fromMap(Map<String, dynamic> data)
      : day = data['day'],
        isHaveGame = data['isHaveGame'];
}
