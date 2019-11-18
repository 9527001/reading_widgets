import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jvtd_uikit/jvtd_uikit.dart';
import 'package:reading_widgets/reading_widgets.dart';

class LoginTopBackground {
  /// 通用按钮
  ///
  /// [onPressed] 点击事件
  /// [title] 导航栏标题
  /// [isNav] 是否有导航栏 默认false
  /// [isLogo] 是否有logo 默认true
  /// [isNote] 是否有'阅世界，育未来' 默认false
  static Widget general({
    VoidCallback onPressed,
    String title = '忘记密码',
    bool isNav = false,
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
          !isNav
              ? Container()
              : AppBar(
                  leading: Builder(builder: (BuildContext context) {
                    return InkWell(
                      onTap: onPressed,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image.asset(
                          RdImages.NAV_RETURN,
                          package: RdImages.PACKAGE,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    );
                  }),
                  title: Text(title),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
          !isLogo ? Container() : Positioned(
            top: 50,
            left: 72,
            right: 72,
            child: Image.asset(
              RdImages.READING_ICON,
              package: RdImages.PACKAGE,
              height: 77,
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
               !isNote ? Container() : Image.asset(
                  RdImages.LOGIN_HOME,
                  package: RdImages.PACKAGE,
                  height: 57,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 注册页面
  static Widget register() {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Image.asset(
            RdImages.LOGIN_REGISTER_BG,
            package: RdImages.PACKAGE,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  RdImages.READING_ICON,
                  package: RdImages.PACKAGE,
                  height: 77,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(72, 20, 72, 0),
                  child: Image.asset(
                    RdImages.LOGIN,
                    package: RdImages.PACKAGE,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //登录首页
  static Widget login() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          register(),
          Image.asset(
            RdImages.LOGIN_HOME,
            package: RdImages.PACKAGE,
            height: 57,
          )
        ],
      ),
    );
  }

  /// 忘记密码
  ///
  /// [onPressed]点击返回按钮事件
  /// [title]标题文字，默认为'忘记密码'
  static Widget findPassword({
    @required VoidCallback onPressed,
    String title = '忘记密码',
  }) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Image.asset(
            RdImages.LOGIN_REGISTER_BG,
            package: RdImages.PACKAGE,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                AppBar(
                  leading: Builder(builder: (BuildContext context) {
                    return InkWell(
                      onTap: onPressed,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image.asset(
                          RdImages.NAV_RETURN,
                          package: RdImages.PACKAGE,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    );
                  }),
                  title: Text(title),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(72, 52, 72, 0),
                  child: Image.asset(
                    RdImages.LOGIN,
                    package: RdImages.PACKAGE,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
