import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

enum GameStatus { scheduled, ongoing, finished }

extension GameStatusExtension on GameStatus {
  String get label {
    switch (this) {
      case GameStatus.scheduled:
        return '경기 예정';
      case GameStatus.ongoing:
        return '경기중';
      case GameStatus.finished:
        return '경기종료';
    }
  }

  Color get color {
    switch (this) {
      case GameStatus.scheduled:
        return MColor.kStatus.cautionary;
      case GameStatus.ongoing:
        return MColor.kStatus.positive;
      case GameStatus.finished:
        return MColor.kStatus.negative;
    }
  }

  static GameStatus fromString(String? status) {
    switch (status?.toUpperCase()) {
      case 'ONGOING':
        return GameStatus.ongoing;
      case 'FINISHED':
        return GameStatus.finished;
      case 'SCHEDULED':
      default:
        return GameStatus.scheduled;
    }
  }
}
