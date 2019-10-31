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
  /// [verticalDirection]阴影位置
  /// [color]背景颜色
  /// [gradient]渐变背景色
  /// [radius]圆角
  /// [borderRadius]圆角 与radius只存在一个
  /// [isShadow]是否显示弥散阴影
  /// [shadowColor] 弥散阴影颜色
  /// [offset]弥散阴影偏移
  /// [border]边框
  static Widget general({
    @required Widget child,
    BoxConstraints constraints,
    EdgeInsets margin = EdgeInsets.zero,
    Alignment alignment = Alignment.center,
    double elevation = 4,
    Color elevationColor = Colors.black12,
    Color color = Colors.white,
    Gradient gradient,
    double radius = 20,
    BorderRadius borderRadius,
    bool isShadow = false,
    Color shadowColor = Colors.black12,
    Offset offset,
    VerticalDirection verticalDirection = VerticalDirection.down,
    BoxBorder border,
  }) {
    return Container(
      constraints: constraints,
      margin: margin,
      color: Colors.transparent,
      child: Container(
        constraints: constraints,
        decoration: BoxDecoration(
          color: elevationColor,
          borderRadius: borderRadius ?? BorderRadius.circular(radius),
          boxShadow: isShadow ? [BoxShadow(blurRadius: elevation, offset: offset ?? Offset(elevation, elevation), color: shadowColor)] : [],
        ),
        child: Container(
          constraints: constraints,
          margin: EdgeInsets.only(top: verticalDirection == VerticalDirection.up ? elevation : 0, bottom: verticalDirection == VerticalDirection.down ? elevation : 0),
          decoration: BoxDecoration(
            border: border,
            borderRadius: borderRadius ?? BorderRadius.circular(radius),
          ),
          child: Container(
            alignment: alignment,
            constraints: constraints,
            child: child,
            decoration: BoxDecoration(
              color: gradient == null ? color : null,
              borderRadius: borderRadius != null ? borderRadius.subtract(BorderRadius.circular(border != null ? elevation : 0)) : BorderRadius.circular(radius - (border != null ? elevation : 0)),
              gradient: gradient,
            ),
          ),
        ),
      ),
    );
  }
}
