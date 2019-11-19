import 'package:flutter/material.dart';
import 'package:jvtd_uikit/jvtd_uikit.dart';
import 'package:reading_widgets/reading_widgets.dart';

enum RdAppBarBackType {
  blue,
  orange,
}

class RdAppBar {
  /// appbar
  static AppBar whiteBack(
    BuildContext context, {
    String title,
    Widget bottom,
    List<Widget> actions,
    Color backgroundColor = RdColors.COLOR_THEME_BLUE,
    TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 18),
    String fontFamily = RdFonts.AlibabaPuHuiTi,
    IconThemeData iconTheme = const IconThemeData(color: Colors.white),
    bool centerTitle = true,
    double elevation = 0,
    double titleSpacing = NavigationToolbar.kMiddleSpacing,
    bool automaticallyImplyLeading = true,
    Widget flexibleSpace,
    Brightness brightness,
    bool primary = true,
    double toolbarOpacity = 1.0,
    double bottomOpacity = 1.0,
    Function onPressed,
        RdAppBarBackType backType = RdAppBarBackType.blue,
  }) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      flexibleSpace: flexibleSpace,
      brightness: brightness,
      primary: primary,
      toolbarOpacity: toolbarOpacity,
      bottomOpacity: bottomOpacity,
      leading: GestureDetector(
        onTap: onPressed ??
            () {
              Navigator.maybePop(context);
            },
        child: Container(
          padding: EdgeInsets.only(left: 16, top: 13, bottom: 13),
          child: JvtdImage.local(name:backType == RdAppBarBackType.blue ? RdImages.NAV_RETURN :RdImages.NAV_RETURN_ORANGE, width: 30, height: 30, package: RdImages.PACKAGE, fit: BoxFit.contain),
        ),
      ),
      title: Text(title),
      bottom: bottom,
      actions: actions,
      backgroundColor: backgroundColor,
      textTheme: TextTheme(title: fontFamily != null && fontFamily.isNotEmpty ? textStyle.copyWith(fontFamily: fontFamily) : textStyle),
      iconTheme: iconTheme,
      centerTitle: centerTitle,
      elevation: elevation,
      titleSpacing: titleSpacing,
    );
  }
}
