import 'package:flutter/material.dart';
import 'package:jvtd_uikit/jvtd_uikit.dart';
import 'package:reading_widgets/reading_widgets.dart';
import 'package:reading_widgets/src/config/reading_color.dart';
import 'package:reading_widgets/src/custom/reading_card.dart';

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
  /// [borderRadius]圆角 与radius只存在一个
  /// [color]背景颜色
  /// [borderColor]边线颜色
  /// [isInk]是否有点击效果
  static Widget border({
    @required VoidCallback onPressed,
    BoxConstraints constraints = const BoxConstraints.expand(height: 50),
    EdgeInsets margin = EdgeInsets.zero,
    @required String title,
    double radius = 100,
    BorderRadiusGeometry borderRadius,
    Color color = RdColors.COLOR_FFF,
    @required Color borderColor,
    TextStyle style,
    bool isInk = true,
  }) {
    style = style ?? TextStyle(color: borderColor, fontSize: 16);
    return Container(
      constraints: constraints,
      margin: margin,
      child:isInk ? FlatButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Text(
          title,
          style: style,
        ),
        shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(radius)), side: BorderSide(color: borderColor)),
        color: color,
      ):FlatButton(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
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
  /// [isInk]是否有点击效果
  /// [alignment]位置
  /// [elevation]阴影大小
  /// [elevationColor] 阴影颜色
  /// [isShadow]是否显示弥散阴影
  /// [shadowColor] 弥散阴影颜色
  /// [offset]弥散阴影偏移
  /// [blurRadius]弥散阴影圆角
  /// [verticalDirection]阴影位置
  /// [isSubscript]角标是否显示
  /// [subscript]角标控件
  /// [isInk]是否点击效果
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
    Alignment alignment = Alignment.center,
    double elevation = 4,
    Color elevationColor = Colors.black12,
    bool isShadow = false,
    Color shadowColor = Colors.black12,
    Offset offset,
    double blurRadius,
    VerticalDirection verticalDirection = VerticalDirection.down,
    bool isSubscript = false,
    Widget subscript,
    bool isInk = true,
  }) {
    return RdCard.general(
      constraints: constraints,
      margin: margin,
      alignment: alignment,
      elevation: elevation,
      elevationColor: elevationColor,
      isShadow: isShadow,
      shadowColor: shadowColor,
      offset: offset,
      verticalDirection: verticalDirection,
      color: color,
      gradient: gradient,
      borderRadius: borderRadius,
      radius: radius,
      blurRadius: blurRadius,
      border: border ??
          (borderSide == BorderSide.none
              ? null
              : Border.all(
                  color: borderSide.color,
                  width: borderSide.width,
                  style: borderSide.style,
                )),
      child: Stack(
        children: <Widget>[
          Container(
            constraints: constraints,
            child: isInk ?  FlatButton(
              onPressed: onPressed,
              padding: EdgeInsets.zero,
              child: Text(
                title,
                style: style,
              ),
              shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(radius))),
            ) : FlatButton(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: onPressed,
              padding: EdgeInsets.zero,
              child: Text(
                title,
                style: style,
              ),
              shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(radius))),
            ),
          ),
          Visibility(
              visible: isSubscript,
              child: subscript ??
                  Positioned(
                    child: JvtdImage.local(name: RdImages.BTN_SUBSCRIPT, package: RdImages.PACKAGE, width: 10, height: 10),
                    left: 10,
                    top: 5,
                  )),
        ],
      ),
    );
  }
}
