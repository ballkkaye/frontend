import 'package:ballkkaye_frontend/data/model/stadium.dart';
import 'package:ballkkaye_frontend/data/repository/game_center_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final RainoutPredictionStadiumProvider = AutoDisposeNotifierProvider.family<RainoutPredictionStadiumVM, RainoutPredictionStadiumModel?, int>(() {
  return RainoutPredictionStadiumVM();
});

class RainoutPredictionStadiumVM extends AutoDisposeFamilyNotifier<RainoutPredictionStadiumModel?, int> {
  final mContext = navigatorKey.currentContext!;

  @override
  RainoutPredictionStadiumModel? build(int stadiumId) {
    loadStadiumList(stadiumId);
    return null;
  }

  Future<void> loadStadiumList(int stadiumId) async {
    Map<String, dynamic> body = await GameCenterRepository().getStadiumList(stadiumId);
    if (body["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("경기장 조회 실패 : ${body["msg"]}")),
      );
      return;
    }
    state = RainoutPredictionStadiumModel.fromMap(body["body"]);
  }
}

class RainoutPredictionStadiumModel {
  List<Stadium> stadiums;

  RainoutPredictionStadiumModel(this.stadiums);

  factory RainoutPredictionStadiumModel.fromMap(Map<String, dynamic> data) {
    return RainoutPredictionStadiumModel(
      (data['stadiumItems'] as List<dynamic>).map((e) => Stadium.fromMap(e)).toList(),
    );
  }

  RainoutPredictionStadiumModel copyWith({
    List<Stadium>? stadiums,
  }) {
    return RainoutPredictionStadiumModel(stadiums ?? this.stadiums);
  }

  @override
  String toString() {
    return 'RainoutPredictionStadiumModel(stadiums: $stadiums)';
  }
}
