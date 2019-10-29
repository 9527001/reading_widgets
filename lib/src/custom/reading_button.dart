import 'package:flutter/material.dart';
import 'package:reading_widgets/src/config/reading_color.dart';

/// 睿丁英语-按钮样式
class RdButton {
  static Widget orangeBorder({
    @required VoidCallback onPressed,
    BoxConstraints constraints = const BoxConstraints.expand(height: 56),
    EdgeInsets margin = EdgeInsets.zero,
    @required String title,
    double radius = 100,
    Color color = RdColors.COLOR_FFF,
    double fontSize = 16,
    TextStyle style,
  }) {
    return border(
        onPressed: onPressed,
        color: color,
        radius: radius,
        constraints: constraints,
        margin: margin,
        title: title,
        borderColor: RdColors.COLOR_THEME_ORANGE,
        style: style ?? TextStyle(fontSize: fontSize, color: RdColors.COLOR_THEME_ORANGE));
  }

  static Widget blueBorder({
    @required VoidCallback onPressed,
    BoxConstraints constraints = const BoxConstraints.expand(height: 56),
    EdgeInsets margin = EdgeInsets.zero,
    @required String title,
    double radius = 100,
    Color color = RdColors.COLOR_FFF,
    double fontSize = 16,
    TextStyle style,
  }) {
    return border(
        onPressed: onPressed,
        color: color,
        radius: radius,
        constraints: constraints,
        margin: margin,
        title: title,
        borderColor: RdColors.COLOR_THEME_BLUE,
        style: style ?? TextStyle(fontSize: fontSize, color: RdColors.COLOR_THEME_BLUE));
  }

  /// 圆角边线按钮
  ///
  /// [onPressed]点击事件
  /// [constraints]宽高约束
  /// [margin]边距
  /// [title]标题
  /// [style]标题样式
  /// [radius]圆角
  /// [borderRadius]圆角 与radius只存在一个
  /// [color]背景颜色
  /// [borderColor]边线颜色
  static Widget border({
    @required VoidCallback onPressed,
    BoxConstraints constraints = const BoxConstraints.expand(height: 56),
    EdgeInsets margin = EdgeInsets.zero,
    @required String title,
    double radius = 100,
    BorderRadiusGeometry borderRadius,
    Color color = RdColors.COLOR_FFF,
    @required Color borderColor,
    TextStyle style,
  }) {
    style = style ?? TextStyle(color: borderColor, fontSize: 16);
    return Container(
      constraints: constraints,
      margin: margin,
      child: FlatButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Text(
          title,
          style: style,
        ),
        shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(radius)), side: BorderSide(color: borderColor)),
        color: color,
      ),
    );
  }

  static Widget blue({
    @required VoidCallback onPressed,
    BoxConstraints constraints = const BoxConstraints.expand(height: 56),
    EdgeInsets margin = EdgeInsets.zero,
    @required String title,
    double radius = 100,
    BorderRadiusGeometry borderRadius,
    BorderSide borderSide = BorderSide.none,
    BoxBorder border,
    double fontSize = 16,
    TextStyle style,
    bool isGradient = false,
  }) {
    return general(
      onPressed: onPressed,
      title: title,
      constraints: constraints,
      margin: margin,
      radius: radius,
      borderRadius: borderRadius,
      borderSide: borderSide,
      border: border,
      color: !isGradient ? RdColors.COLOR_THEME_BLUE : null,
      gradient: isGradient ? RdColors.GRADIENT_THEME_BLUE_BACKGROUND : null,
      style: style ?? TextStyle(fontSize: fontSize, color: RdColors.COLOR_FFF),
    );
  }

  static Widget orange({
    @required VoidCallback onPressed,
    BoxConstraints constraints = const BoxConstraints.expand(height: 56),
    EdgeInsets margin = EdgeInsets.zero,
    @required String title,
    double radius = 100,
    BorderRadiusGeometry borderRadius,
    BorderSide borderSide = BorderSide.none,
    BoxBorder border,
    double fontSize = 16,
    TextStyle style,
    bool isGradient = false,
  }) {
    return general(
      onPressed: onPressed,
      title: title,
      constraints: constraints,
      margin: margin,
      radius: radius,
      borderRadius: borderRadius,
      borderSide: borderSide,
      border: border,
      color: !isGradient ? RdColors.COLOR_THEME_ORANGE : null,
      gradient: isGradient ? RdColors.GRADIENT_THEME_ORANGE_BACKGROUND : null,
      style: style ?? TextStyle(fontSize: fontSize, color: RdColors.COLOR_FFF),
    );
  }

  /// 圆角背景按钮
  ///
  /// [onPressed]点击事件
  /// [constraints]宽高约束
  /// [margin]边距
  /// [title]标题
  /// [style]标题样式
  /// [radius]圆角
  /// [color]背景颜色
  /// [gradient]渐变背景
  /// [borderSide]边线样式
  /// [border] 边线样式 与borderSide只存在一个
  ///
  /// 如果圆角与边线同时存在，边线必须保证四周都有，不能仅出现一个边线
  static Widget general({
    @required VoidCallback onPressed,
    BoxConstraints constraints = const BoxConstraints.expand(height: 56),
    EdgeInsets margin = EdgeInsets.zero,
    @required String title,
    double radius = 100,
    BorderRadiusGeometry borderRadius,
    Color color = RdColors.COLOR_FFF,
    Gradient gradient,
    BorderSide borderSide = BorderSide.none,
    BoxBorder border,
    TextStyle style = const TextStyle(color: RdColors.COLOR_000, fontSize: 16),
  }) {
    return Container(
      constraints: constraints,
      margin: margin,
      decoration: BoxDecoration(
        color: gradient != null ? null : color,
        gradient: gradient,
        borderRadius: borderRadius ?? BorderRadius.circular(radius),
        border: border ??
            (borderSide == BorderSide.none
                ? null
                : Border.all(
                    color: borderSide.color,
                    width: borderSide.width,
                    style: borderSide.style,
                  )),
      ),
      child: FlatButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Text(
          title,
          style: style,
        ),
        shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(radius))),
        color: color,
      ),
    );
  }
}
