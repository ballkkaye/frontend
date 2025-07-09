import 'package:ballkkaye_frontend/data/repository/game_center_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rainoutPredictionWeatherProvider = AutoDisposeNotifierProvider.family<
    RainoutPredictionWeatherVM, RainoutPredictionWeatherModel?, int>(() {
  return RainoutPredictionWeatherVM();
});

class RainoutPredictionWeatherVM
    extends AutoDisposeFamilyNotifier<RainoutPredictionWeatherModel?, int> {
  final mContext = navigatorKey.currentContext!;

  @override
  RainoutPredictionWeatherModel? build(int chatRoomId) {
    // 1. 더미 데이터 먼저 보여줌
    state = RainoutPredictionWeatherModel(
      location: '잠실야구장',
      hourly: [
        HourlyWeather(
          hour: DateTime.now().hour,
          temperature: 26.0,
          temperatureDiffFromYesterday: "2.0°↑",
          weatherCode: "맑음",
          humidity: 85.0,
          windDirection: '남풍',
          windSpeed: 1.3,
        ),
      ],
      hourlyRain: [
        HourlyRain(hour: DateTime.now().hour, rainPer: 30.0, rainAmount: 1.2),
      ],
      message: '우천취소 가능성 낮음',
    );

    // 2. 이후에 API 호출해서 실제 데이터로 덮어쓰기
    loadWeather(chatRoomId);
    return state;
  }

  Future<void> loadWeather(int stadiumId) async {
    Map<String, dynamic> body = await GameCenterRepository().getStadiumList(stadiumId);
    if (body["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("날씨 불러오기 실패 : ${body["msg"]}")),
      );
      return;
    }
    state = RainoutPredictionWeatherModel.fromMap(body["body"]);
  }
}

class RainoutPredictionWeatherModel {
  final String location;
  final List<HourlyWeather> hourly;
  final List<HourlyRain> hourlyRain;
  final String message;

  RainoutPredictionWeatherModel({
    required this.location,
    required this.hourly,
    required this.hourlyRain,
    required this.message,
  });

  factory RainoutPredictionWeatherModel.fromMap(Map<String, dynamic> map) {
    return RainoutPredictionWeatherModel(
      location: map['location'],
      hourly: (map['hourly'] as List).map((e) => HourlyWeather.fromMap(e)).toList(),
      hourlyRain: (map['hourlyRain'] as List).map((e) => HourlyRain.fromMap(e)).toList(),
      message: map['message'],
    );
  }
}

class HourlyWeather {
  final int hour;
  final double temperature;
  final String temperatureDiffFromYesterday;
  final String weatherCode;
  final double humidity;
  final String windDirection;
  final double windSpeed;

  HourlyWeather({
    required this.hour,
    required this.temperature,
    required this.temperatureDiffFromYesterday,
    required this.weatherCode,
    required this.humidity,
    required this.windDirection,
    required this.windSpeed,
  });

  factory HourlyWeather.fromMap(Map<String, dynamic> map) {
    return HourlyWeather(
      hour: map['hour'],
      temperature: (map['temperature'] as num).toDouble(),
      temperatureDiffFromYesterday: map['temperatureDiffFromYesterday'],
      weatherCode: map['weatherCode'],
      humidity: (map['humidity'] as num).toDouble(),
      windDirection: map['windDirection'],
      windSpeed: (map['windSpeed'] as num).toDouble(),
    );
  }
}

class HourlyRain {
  final int hour;
  final double rainPer;
  final double rainAmount;

  HourlyRain({
    required this.hour,
    required this.rainPer,
    required this.rainAmount,
  });

  factory HourlyRain.fromMap(Map<String, dynamic> map) {
    return HourlyRain(
      hour: map['hour'],
      rainPer: (map['rainPer'] as num).toDouble(),
      rainAmount: (map['rainAmount'] as num).toDouble(),
    );
  }
}
