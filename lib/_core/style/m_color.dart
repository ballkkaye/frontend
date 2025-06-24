
// 예시
// const kPrimaryColor = "";
// const kActiveColor = "";
// const kSecondaryColor = "";

import 'package:flutter/material.dart';

class MColor {
  static const kPrimary = _PrimaryColors();
  static const kLabel = _LabelColors();
  static const kBackground = _BackgroundColors();
  static const kLine = _LineColors();
  static const kStatus = _StatusColors();
  static const kAccent = _AccentColors();
  static const kFill = _FillColors();
  static const kShadow = _ShadowColors();
}

// Primary Colors
class _PrimaryColors {
  const _PrimaryColors();
  final Color alternative = const Color(0xFF4EE1BB);
  final Color normal = const Color(0xFF00DAB2);
  final Color strong = const Color(0xFF16D4B1);
  final Color heavy = const Color(0xFF00987C);
}

// Label Colors
class _LabelColors {
  const _LabelColors();
  final Color normal = const Color(0xFF171918);
  final Color strong = const Color(0xFF000000);
  final Color neutral = const Color(0xFF565656);
  final Color alternative = const Color(0xFFB4B4B4);
  final Color disable = const Color(0xFFE0E0E0);
  final Color white = const Color(0xFFFFFFFF);
}

// Background Colors
class _BackgroundColors {
  const _BackgroundColors();
  final Color normal = const Color(0xFFFFFFFF);
  final Color alternative = const Color(0xFFF7F7F8);
}

// Line Colors
class _LineColors {
  const _LineColors();
  final Color normal = const Color(0xFFD7D7D7);
  final Color alternative = const Color(0xFFE0E0E0);
}

// Status Colors
class _StatusColors {
  const _StatusColors();
  final Color positive = const Color(0xFF2ACA85);
  final Color cautionary = const Color(0xFFFB9016);
  final Color negative = const Color(0xFFFF4747);
}

// Accent Colors
class _AccentColors {
  const _AccentColors();
  final Color yellow = const Color(0xFFFFFB83);
  final Color blue = const Color(0xFF183CC9);
  final Color navy = const Color(0xFF252E6B);
}

// Fill Colors
class _FillColors {
  const _FillColors();
  final Color normal = const Color(0x4DD7D7D7);
  final Color strong = const Color(0x99BCBCBC);
  final Color alternative = const Color(0x80F3F3F3);
}

class _ShadowColors {
  const _ShadowColors();

  // normal
  final List<BoxShadow> normal = const [
    BoxShadow(
      color: Color(0x14000000), // 8% black
      blurRadius: 1,
      offset: Offset(0, 0),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 4,
      offset: Offset(0, 1),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1E000000), // 12% black
      blurRadius: 8,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
  ];

  // emphasize
  final List<BoxShadow> emphasize = const [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 4,
      offset: Offset(0, 0),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 8,
      offset: Offset(0, 4),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1E000000),
      blurRadius: 12,
      offset: Offset(0, 6),
      spreadRadius: 0,
    ),
  ];

  // strong
  final List<BoxShadow> strong = const [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 8,
      offset: Offset(0, 0),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 16,
      offset: Offset(0, 8),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1E000000),
      blurRadius: 20,
      offset: Offset(0, 16),
      spreadRadius: 0,
    ),
  ];
}