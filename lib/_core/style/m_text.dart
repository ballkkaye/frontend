// 예시
// TextStyle h1(String text){
//   return Text("$text", style());
// }

import 'package:flutter/material.dart';

/// 전역 텍스트 스타일을 적용한 Text 위젯 반환용 클래스
/// 예시: MText.h1("타이틀")
class MText {
  static Text h1(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: color),
      );

  static Text h2(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: color),
      );

  static Text h3_7(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: color),
      );

  static Text h3_6(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: color),
      );

  static Text h4(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: color),
      );

  static Text valid(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: color),
      );

  static Text label1_6(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: color),
      );

  static Text label1_5(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: color),
      );

  static Text label1_4(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color),
      );

  static Text label2_7(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: color),
      );

  static Text label2_5(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: color),
      );

  static Text label2_4(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: color),
      );

  static Text label3(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: color),
      );

  static Text button1(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: color),
      );

  static Text button2(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: color),
      );

  static Text button3(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: color),
      );

  static Text button4_7(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: color),
      );

  static Text button4_5(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: color),
      );

  static Text button4_4(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color),
      );

  static Text button5_7(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: color),
      );

  static Text button5_6(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color),
      );

  static Text modal1(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: color),
      );

  static Text modal2_5(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: color),
      );

  static Text modal2_4(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: color),
      );

  static Text modal3_7(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: color),
      );

  static Text modal3_5(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: color),
      );

  static Text modal3_4(String text, {Color? color}) => Text(
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color),
      );

  static TextStyle modal5({Color? color}) =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color);
}
