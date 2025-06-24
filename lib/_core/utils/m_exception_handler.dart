import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';

class ExceptionHandler {
  static void handleException(dynamic exception, StackTrace stackTrace) {
    print('Exception occurred: $exception');
    print('StackTrace: $stackTrace');

    final mContext = navigatorKey.currentContext;

    ScaffoldMessenger.of(mContext!).showSnackBar(
      SnackBar(content: Text("$exception")),
    );
  }
}