import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/data/repository/game_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final userMatchSelectGameProvider =
    AutoDisposeNotifierProvider.family<UserMatchSelectGameVM, UserMatchSelectGameModel?, String>(
        () {
  return UserMatchSelectGameVM();
});

class UserMatchSelectGameVM extends AutoDisposeFamilyNotifier<UserMatchSelectGameModel?, String> {
  final mContext = navigatorKey.currentContext!;

  @override
  UserMatchSelectGameModel? build(String date) {
    init(date);

    ref.onDispose(() {
      Logger().d("UserMatchSelectGameVM 파괴됨");
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

    state = UserMatchSelectGameModel.fromMap(data["body"]);
  }
}

class UserMatchSelectGameModel {
  final List<Game> games;
  final String selectedDate;

  UserMatchSelectGameModel({
    required this.games,
    required this.selectedDate,
  });

  UserMatchSelectGameModel.fromMap(Map<String, dynamic> data)
      : selectedDate = data['selectedDate'],
        games = data['games'][0]['items'].map((e) => Game.fromMap(e)).toList();

  UserMatchSelectGameModel copyWith({
    List<Game>? games,
    String? selectedDate,
  }) {
    return UserMatchSelectGameModel(
      games: games ?? this.games,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }

  @override
  String toString() {
    return 'UserMatchSelectGameModel{games: $games, selectedDate: $selectedDate}';
  }
}
