import 'package:ballkkaye_frontend/data/repository/game_center_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final rainoutPredictionWeatherProvider = AutoDisposeNotifierProvider.family<
    RainoutPredictionWeatherVM, RainoutPredictionWeatherModel?, int?>(() {
  return RainoutPredictionWeatherVM();
});

class RainoutPredictionWeatherVM
    extends AutoDisposeFamilyNotifier<RainoutPredictionWeatherModel?, int?> {
  final mContext = navigatorKey.currentContext!;

  @override
  RainoutPredictionWeatherModel? build(int? stadiumId) {
    loadWeather(stadiumId ??
        5); // 드롭다운 첫번째 아이템이 잠실이니 잠실 기준으로 진입. // TODO : 현재 잠실 데이터가 없어서 고척으로 설정 -> 추후 수정

    return null;
  }

  Future<void> loadWeather(int stadiumId) async {
    Logger().d("stadiumId: $stadiumId");
    Map<String, dynamic> body =
        await GameCenterRepository().getWeatherInfo(stadiumId);
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
      hourly:
          (map['hourly'] as List).map((e) => HourlyWeather.fromMap(e)).toList(),
      hourlyRain: (map['hourlyRain'] as List)
          .map((e) => HourlyRain.fromMap(e))
          .toList(),
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
