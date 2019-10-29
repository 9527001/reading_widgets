import 'package:flutter/material.dart';

/// 睿丁英语 通用颜色
class RdColors{
  static const Color COLOR_THEME_ORANGE = MaterialColor(
    _themePrimaryValue,
    <int, Color>{
      50: Color(_themePrimaryValue),
      100: Color(_themePrimaryValue),
      200: Color(_themePrimaryValue),
      300: Color(_themePrimaryValue),
      400: Color(_themePrimaryValue),
      500: Color(_themePrimaryValue),
      600: Color(_themePrimaryValue),
      700: Color(_themePrimaryValue),
      800: Color(_themePrimaryValue),
      900: Color(_themePrimaryValue),
    },
  );
  static const int _themePrimaryValue = 0xffFFA80A; //主题色-橘色
  static const LinearGradient GRADIENT_THEME_ORANGE_BACKGROUND = const LinearGradient(colors: [COLOR_THEME_ORANGE, COLOR_THEME_BLUE], begin: Alignment.centerLeft, end: Alignment.centerRight);

  static const Color COLOR_THEME_BLUE = MaterialColor(
    _themePrimaryBlueValue,
    <int, Color>{
      50: Color(_themePrimaryBlueValue),
      100: Color(_themePrimaryBlueValue),
      200: Color(_themePrimaryBlueValue),
      300: Color(_themePrimaryBlueValue),
      400: Color(_themePrimaryBlueValue),
      500: Color(_themePrimaryBlueValue),
      600: Color(_themePrimaryBlueValue),
      700: Color(_themePrimaryBlueValue),
      800: Color(_themePrimaryBlueValue),
      900: Color(_themePrimaryBlueValue),
    },
  );
  static const int _themePrimaryBlueValue = 0xff33A3FF; //主题色-蓝色
  static const LinearGradient GRADIENT_THEME_BLUE_BACKGROUND = const LinearGradient(colors: [COLOR_THEME_BLUE, COLOR_THEME_ORANGE], begin: Alignment.centerLeft, end: Alignment.centerRight);


  static const Color COLOR_CCC = Color(0xffcccccc);
  static const Color COLOR_FFF = Color(0xffffffff);
  static const Color COLOR_FFF_50 = Color(0x77ffffff);
  static const Color COLOR_E8E8E8 = Color(0xffe8e8e8);
  static const Color COLOR_F2F2F2 = Color(0xfff2f2f2);
  static const Color COLOR_F7F7F7 = Color(0xfff7f7f7);
  static const Color COLOR_4D4D4D = Color(0xff4d4d4d);
  static const Color COLOR_D9D9D9 = Color(0xffd9d9d9);
  static const Color COLOR_333 = Color(0xff333333);
  static const Color COLOR_666 = Color(0xff666666);
  static const Color COLOR_999 = Color(0xff999999);
  static const Color COLOR_999_10 = Color(0x19999999);
  static const Color COLOR_000 = Color(0xff000000);
  static const Color COLOR_000_50 = Color(0x77000000);
  static const Color COLOR_TRANSPARENT = Color(0x01000000);
  static const Color COLOR_404040 = Color(0xff404040);
  static const Color COLOR_B6B6B6 = Color(0xffb6b6b6);
}