import 'package:flutter/material.dart';

class AppColors {
  static const green = Color(0xFF004643);
  static const offWhite = Color(0xFFFAFCFF);
  static const lightSky = Color(0xFFDEEDFE);
  static const lightGreen = Color(0xFF44F1A6);
  static const cloudMist = Color(0xFFE6ECF1);
  static const cloud = Color(0xFFCCDDF6);
  static const lightCloud = Color(0xFFE1EFFD);

  static const MaterialColor greyScale = MaterialColor(0xFFEAE9E8, <int, Color>{
    10: Color(0xFFC4C4C4),
    20: Color(0xFFF4F4F4),
    30: Color(0xFF757575),
    40: Color(0xFF8B8B8B),
    50: Color(0xFFC4C4C4),
    60: Color(0xFFF1F1F5),
    70: Color(0xFF666159),
    90: Color(0xFF3A3329),
    100: Color(0xFF150D02),
    110: Color(0xFF363A40),
    120: Color(0xFFF5F5F5),
    130: Color(0xFFD9D9D9),
    140: Color(0xFF737373),
  });

  static BoxShadow boxShadow = BoxShadow(
    color: green.withAlpha(25), //color of shadow
    spreadRadius: 5,
    blurRadius: 5,
    offset: Offset(0, 5),
  );
}
