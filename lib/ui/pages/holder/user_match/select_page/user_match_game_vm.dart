import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/data/repository/game_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final userMatchGameProvider = AutoDisposeNotifierProvider.family<
    UserMatchGameVM, UserMatchGameModel?, String>(() {
  return UserMatchGameVM();
});

class UserMatchGameVM
    extends AutoDisposeFamilyNotifier<UserMatchGameModel?, String> {
  final mContext = navigatorKey.currentContext!;

  @override
  UserMatchGameModel? build(String date) {
    init(date);

    ref.onDispose(() {
      Logger().d("UserMatchGameVM 파괴됨");
    });

    return null;
  }

  Future<void> init(String date) async {
    Map<String, dynamic> data = await GameRepository().getList(date);
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("동행 상세보기 실패 : ${data["msg"]}")),
      );
      return;
    }

    state = UserMatchGameModel.fromMap(data["body"]);
  }
}

class UserMatchGameModel {
  final List<Game> games;
  final String selectedDate;

  UserMatchGameModel({
    required this.games,
    required this.selectedDate,
  });

  UserMatchGameModel.fromMap(Map<String, dynamic> data)
      : selectedDate = data['selectedDate'],
        games = data['games'][0]['items'].map((e) => Game.fromMap(e)).toList();

  UserMatchGameModel copyWith({
    List<Game>? games,
    String? selectedDate,
  }) {
    return UserMatchGameModel(
      games: games ?? this.games,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }

  @override
  String toString() {
    return 'UserMatchGameModel{games: $games, selectedDate: $selectedDate}';
  }
}
