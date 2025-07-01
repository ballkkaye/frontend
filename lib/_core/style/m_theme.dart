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
import 'package:ballkkaye_frontend/_core/style/m_size.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/_core/style/m_color.dart';

ThemeData mTheme() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: MColor.kPrimary.strong,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: MColor.kLabel.normal),
      centerTitle: true,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardRadius),
      ),
      elevation: 5,
      margin: EdgeInsets.all(gapM),
    ),
    dividerTheme: DividerThemeData(
      thickness: dividerThickness,
      color: MColor.kLine.normal,
    ),
    textTheme: GoogleFonts.notoSansTextTheme(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: MColor.kPrimary.strong,
      unselectedItemColor: MColor.kLabel.neutral,
      selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
      unselectedLabelStyle:
          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(buttonRadius),
      ),
      buttonColor: MColor.kPrimary.strong,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusM),
        borderSide: BorderSide(color: MColor.kLine.normal),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: gapM, vertical: gapS),
      hintStyle: TextStyle(fontSize: 14, color: MColor.kLabel.disable),
    ),
  );
}
