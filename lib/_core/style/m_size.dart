import 'package:flutter/material.dart';

// 예시
// double height = 50;
// SizedBox();

// import 'package:flutter/material.dart';
//
// const double smallGap = 5.0;
// const double mediumGap = 10.0;
// const double largeGap = 20.0;
// const double xlargeGap = 100.0;
//
// double getScreenWidth(BuildContext context) {
//   return MediaQuery.of(context).size.width;
// }
//
// double getDrawerWidth(BuildContext context) {
//   return getScreenWidth(context) * 0.6;
// }

// Gap constants
const double gapXS = 2.0;
const double gapS = 5.0;
const double gapM = 10.0;
const double gapL = 16.0;
const double gapXL = 20.0;
const double gapXXL = 24.0;
const double gapHuge = 32.0;

// Radius constants
const double radiusXS = 4.0;
const double radiusS = 6.0;
const double radiusM = 8.0;
const double radiusL = 10.0;
const double radiusXL = 12.0;
const double radiusXXL = 15.0;
const double radiusHuge = 20.0;
const double radiusCircle = 50.0;

// Card/Button/Tag radius
const double cardRadius = radiusM;
const double buttonRadius = radiusXL;
const double tagRadius = radiusXXL;

// Icon sizes
const double iconSizeS = 16.0;
const double iconSizeM = 24.0;
const double iconSizeL = 32.0;

// Font sizes (for reference)
const double fontSizeTiny = 10.0;
const double fontSizeSmall = 12.0;
const double fontSizeNormal = 14.0;
const double fontSizeMedium = 16.0;
const double fontSizeLarge = 18.0;
const double fontSizeXL = 20.0;
const double fontSizeXXL = 24.0;
const double fontSizeHuge = 64.0;

// Heights/Widths
const double heightButton = 48.0;
const double heightInput = 44.0;
const double heightCard = 140.0;
const double widthButton = double.infinity;

// Animation durations
const Duration animDurationFast = Duration(milliseconds: 200);
const Duration animDurationNormal = Duration(milliseconds: 400);
const Duration animDurationSlow = Duration(milliseconds: 800);

// Divider/Line
const double dividerThickness = 1.0;
const double dividerThick = 15.0;

// Utility functions
double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getDrawerWidth(BuildContext context) {
  return getScreenWidth(context) * 0.6;
}
