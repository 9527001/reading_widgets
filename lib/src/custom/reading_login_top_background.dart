import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jvtd_uikit/jvtd_uikit.dart';
import 'package:reading_widgets/reading_widgets.dart';

class RdLoginTopBackground {
  /// 通用按钮
  ///
  /// [isLogo] 是否有logo 默认true
  /// [isNote] 是否有'阅世界，育未来' 默认false
  static Widget general({
    bool isLogo = true,
    bool isNote = false,
  }) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Image.asset(
            RdImages.LOGIN_REGISTER_BG,
            package: RdImages.PACKAGE,
          ),
          Positioned(
            top: 50,
            left: 72,
            right: 72,
            child: Visibility(
              visible: isLogo,
              child: Image.asset(
                RdImages.READING_ICON,
                package: RdImages.PACKAGE,
                height: 77,
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 72,
            right: 72,
            child: Column(
              children: <Widget>[
                Image.asset(
                  RdImages.LOGIN,
                  package: RdImages.PACKAGE,
                  width: 232,
                ),
                Visibility(
                  visible: isNote,
                  child: Image.asset(
                    RdImages.LOGIN_HOME,
                    package: RdImages.PACKAGE,
                    height: 57,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
