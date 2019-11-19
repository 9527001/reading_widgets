import 'package:flutter/material.dart';

class RdFonts{
  static const String AlibabaPuHuiTi = "AlibabaPuHuiTi";

  /// 文字赋予样式
  static TextStyle family(TextStyle style,String fontFamily){
    return fontFamily == null || fontFamily.isEmpty ? style : style.copyWith(fontFamily: fontFamily);
  }
}

