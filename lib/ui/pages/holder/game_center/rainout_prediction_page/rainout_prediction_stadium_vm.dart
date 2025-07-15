import 'package:ballkkaye_frontend/data/model/stadium.dart';
import 'package:ballkkaye_frontend/data/repository/game_center_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rainoutPredictionStadiumProvider =
    AutoDisposeNotifierProvider<RainoutPredictionStadiumVM, RainoutPredictionStadiumModel?>(() {
  return RainoutPredictionStadiumVM();
});

class RainoutPredictionStadiumVM extends AutoDisposeNotifier<RainoutPredictionStadiumModel?> {
  final mContext = navigatorKey.currentContext!;

  @override
  RainoutPredictionStadiumModel? build() {
    init();
    return null;
  }

  Future<void> init() async {
    Map<String, dynamic> body = await GameCenterRepository().getStadiumList();
    if (body["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("경기장 조회 실패 : ${body["msg"]}")),
      );
      return;
    }
    state = RainoutPredictionStadiumModel.fromList(body["body"]);
  }
}

class RainoutPredictionStadiumModel {
  List<Stadium> stadiums;

  RainoutPredictionStadiumModel(this.stadiums);

  factory RainoutPredictionStadiumModel.fromList(List<dynamic> data) {
    return RainoutPredictionStadiumModel(
      data.map((e) => Stadium.fromMap(e)).toList(),
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
