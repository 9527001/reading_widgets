import 'package:flutter/material.dart';

/// 睿丁英语-按钮样式
class RdButton {
  /// 圆角边线按钮
  ///
  /// [onPressed]点击事件
  /// [constraints]宽高约束
  /// [margin]边距
  /// [title]标题
  /// [style]标题样式
  /// [radius]圆角
  /// [color]背景颜色
  /// [borderColor]边线颜色
  static Widget border({
    @required VoidCallback onPressed,
    BoxConstraints constraints = const BoxConstraints.expand(height: 40),
    EdgeInsets margin = EdgeInsets.zero,
    @required String title,
    double radius = 100,
    Color color = Colors.white,
    Color borderColor = Colors.blue,
    TextStyle style = const TextStyle(color: Colors.blue,fontSize: 15),
  }) {
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius)), side: BorderSide(color: borderColor)),
        color: color,
      ),
    );
  }
}
