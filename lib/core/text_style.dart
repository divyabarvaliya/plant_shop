import 'package:flutter/material.dart';
import 'package:plant_shop/core/font_family.dart';

import 'dimens.dart';

class AppTextStyle {
  static const double textSpacing = 1;

  static const TextStyle defaultStyle = TextStyle(
    letterSpacing: textSpacing,
    fontFamily: FontFamily.defaultFont,
    color: Colors.black,
    height: 1.0,
  );

  static TextStyle bold = defaultStyle.copyWith(fontWeight: FontWeight.w700);
  static TextStyle semiBold = defaultStyle.copyWith(
    fontWeight: FontWeight.w600,
  );
  static TextStyle regular = defaultStyle.copyWith(
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );
  static TextStyle light = defaultStyle.copyWith(fontWeight: FontWeight.w300);
  static TextStyle ultraLight = defaultStyle.copyWith(
    fontWeight: FontWeight.w200,
  );
  static TextStyle thin = defaultStyle.copyWith(fontWeight: FontWeight.w100);
  static TextStyle extraBold = defaultStyle.copyWith(
    fontWeight: FontWeight.w800,
  );
  static TextStyle black = defaultStyle.copyWith(fontWeight: FontWeight.w900);

  static Map<int, TextStyle> bodyRegular = {
    9: regular.copyWith(fontSize: Dimens.s_8()),
    10: regular.copyWith(fontSize: Dimens.s_10()),
    12: regular.copyWith(fontSize: Dimens.s_12()),
    14: regular.copyWith(fontSize: Dimens.s_14()),
    15: regular.copyWith(fontSize: Dimens.s_15()),
    16: regular.copyWith(fontSize: Dimens.s_16()),
    20: regular.copyWith(fontSize: Dimens.s_20()),
    24: regular.copyWith(fontSize: Dimens.s_24()),
    25: regular.copyWith(fontSize: Dimens.s_25()),
  };
}
