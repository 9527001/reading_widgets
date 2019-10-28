import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 睿丁英语-卡片样式
class RdCard {
  /// 阴影布局
  ///
  /// [child]子控件
  /// [constraints]宽高约束
  /// [margin]边距
  /// [elevation]阴影高度
  /// [elevationColor]阴影颜色
  /// [color]背景颜色
  /// [gradient]渐变背景色
  /// [radius]圆角
  static Widget general({
    @required Widget child,
    BoxConstraints constraints = const BoxConstraints.expand(height: 40),
    EdgeInsets margin = EdgeInsets.zero,
    Alignment alignment = Alignment.center,
    double elevation = 4,
    Color elevationColor = Colors.black12,
    Color color = Colors.white,
    Gradient gradient,
    double radius = 20,
    bool isShadow = false,
  }) {
    return Container(
      constraints: constraints,
      margin: margin,
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: elevation * 2,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(color: elevationColor, borderRadius: BorderRadius.circular(radius)),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: elevation,
            child: Container(
              alignment: alignment,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(radius),
                gradient: gradient,
                boxShadow: isShadow ? [BoxShadow(blurRadius: elevation, offset: Offset(elevation, elevation * 2), color: Colors.black12)] : [],
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
