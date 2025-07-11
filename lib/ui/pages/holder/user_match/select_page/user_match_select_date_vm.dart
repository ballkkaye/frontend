import 'package:ballkkaye_frontend/data/repository/game_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final userMatchSelectDateProvider =
    AutoDisposeNotifierProvider<UserMatchSelectDateVM, UserMatchSelectDateModel?>(() {
  return UserMatchSelectDateVM();
});

class UserMatchSelectDateVM extends AutoDisposeNotifier<UserMatchSelectDateModel?> {
  final mContext = navigatorKey.currentContext!;

  @override
  UserMatchSelectDateModel? build() {
    init();

    ref.onDispose(() {
      Logger().d("UserMatchSelectDateVM 파괴됨");
    });

    return null;
  }

  Future<void> init() async {
    Map<String, dynamic> data = await GameRepository().getAvailableDateList();
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("동행글 작성 전 날짜 선택 통신 실패 : ${data["msg"]}")),
      );
      return;
    }

    state = UserMatchSelectDateModel.fromList(data["body"]);
  }
}

class UserMatchSelectDateModel {
  final List<AvailableYear> years;

  UserMatchSelectDateModel(this.years);

  UserMatchSelectDateModel.fromList(List<dynamic> list)
      : years = list.map((e) => AvailableYear.fromMap(e)).toList();

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

  @override
  String toString() =>
      'UserMatchSelectDateModel(min: $minimumDate, max: $maximumDate, total: ${allAvailableDates.length})';
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
