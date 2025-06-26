// 예시
// import 'package:flutter/material.dart';
//
// ThemeData theme() {
//   return ThemeData(
//     appBarTheme: appBarTheme(),
//     useMaterial3: true,
//   );
// }
//
// AppBarTheme appBarTheme() {
//   return const AppBarTheme(
//     titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
//     centerTitle: true,
//     backgroundColor: Colors.black12,
//     elevation: 0,
//   );
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData mTheme() {
  return ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.notoSansTextTheme(),
      appBarTheme: AppBarTheme(backgroundColor: Colors.white),
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      ),
      cardTheme: CardThemeData(color: Colors.white));
}
