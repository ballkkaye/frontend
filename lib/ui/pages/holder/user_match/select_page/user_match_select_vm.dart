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
    Map<String, dynamic> data = await GameRepository().getList(date);
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("동행글 작성 전 경기 선택 통신 실패 : ${data["msg"]}")),
      );
      return;
    }

    state = UserMatchSelectModel.fromMap(data["body"]);
  }
}

class UserMatchSelectModel {
  final List<AvailableYear> years; // 날짜 구조
  final List<Game> games; // 경기 리스트
  final String selectedDate; // 선택된 날짜

  UserMatchSelectModel({
    required this.years,
    required this.games,
    required this.selectedDate,
  });

  factory UserMatchSelectModel.initial() => UserMatchSelectModel(
        years: [],
        games: [],
        selectedDate: formatDateToStr(today),
      );

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

  /// 모든 가능한 날짜 리스트 추출
  List<DateTime> get allAvailableDates {
    List<DateTime> list = [];
    for (var year in years) {
      for (var month in year.months) {
        for (var day in month.days) {
          if (day.isHaveGame) {
            list.add(DateTime(
              int.parse(year.year),
              int.parse(month.month),
              int.parse(day.day),
            ));
          }
        }
      }
    }
    return list..sort();
  }

  DateTime get minimumDate => allAvailableDates.first;
  DateTime get maximumDate => allAvailableDates.last;

  bool isGameDay(DateTime date) {
    for (final year in years) {
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
    return games.map((g) {
      return {
        'gameId': g.id,
        'game': '${g.awayTeam.fullName} vs ${g.homeTeam.fullName} (${g.stadiumShortName})',
      };
    }).toList();
  }

  @override
  String toString() {
    return 'UserMatchSelectModel{selectedDate: $selectedDate, games: ${games.length}, totalDates: ${allAvailableDates.length}}';
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
