import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jvtd_uikit/jvtd_uikit.dart';

import '../../reading_widgets.dart';

class RdToast {
  static final int RD_LENGTH_SHORT = 1;
  static final int RD_LENGTH_LONG = 2;

  static void show(
    BuildContext context,
    String msg,
    String img, {
    String package,
    int duration = 4,
    Color bgColor = RdColors.COLOR_FFF,
    Color elevationColor = RdColors.COLOR_CCE9FF,
    TextStyle textStyle = const TextStyle(color: RdColors.COLOR_636679, fontSize: 14, fontFamily: RdFonts.AlibabaPuHuiTi),
  }) {
    RdToastView.dismiss();
    RdToastView.createView(context, msg, img, duration, bgColor, elevationColor, textStyle, package);
  }
}

class RdToastView {
  static final RdToastView _singleton = new RdToastView._internal();

  factory RdToastView() {
    return _singleton;
  }

  RdToastView._internal();

  static OverlayState overlayState;
  static OverlayEntry _overlayEntry;
  static bool _isVisible = false;

  static void createView(
    BuildContext context,
    String msg,
    String img,
    int duration,
    Color bgColor,
    Color elevationColor,
    TextStyle textStyle,
    String package,
  ) async {
    overlayState = Overlay.of(context);

    Paint paint = Paint();
    paint.strokeCap = StrokeCap.square;
    paint.color = Color(0xAA000000);

    _overlayEntry = new OverlayEntry(
      builder: (BuildContext context) => RdToastWidget(
        widget: Container(
          color: Colors.black26,
          width: MediaQuery.of(context).size.width,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: RdCard.general(
              constraints: BoxConstraints.expand(width: 187.5, height: 152),
              radius: 30,
              elevationColor: elevationColor,
              color: bgColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  JvtdImage.local(
                    name: img,
                    package: package,
                    width: 56,
                    height: 56,
                    fit: BoxFit.contain
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    msg,
                    style: textStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    _isVisible = true;
    overlayState.insert(_overlayEntry);
    await new Future.delayed(Duration(seconds: duration == null ? RdToast.RD_LENGTH_SHORT : duration));
    dismiss();
  }

  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}

class RdToastWidget extends StatelessWidget {
  RdToastWidget({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return new Positioned(
        child: Material(
      color: Colors.transparent,
      child: widget,
    ));
  }
}
