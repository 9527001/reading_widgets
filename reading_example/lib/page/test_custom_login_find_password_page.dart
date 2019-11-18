import 'package:flutter/material.dart';
import 'package:reading_widgets/reading_widgets.dart';

class CustomLoginFindPasswordPage extends StatefulWidget {
  @override
  _CustomLoginTopBackgroundPageState createState() =>
      _CustomLoginTopBackgroundPageState();
}

class _CustomLoginTopBackgroundPageState
    extends State<CustomLoginFindPasswordPage> {
  @override
  Widget build(BuildContext context) {
//    return LoginTopBackground.findPassword(
//        title: '忘记密码，啥都行',
//        onPressed: () {
//          Navigator.pop(context);
//        });
    return RdLoginTopBackground.general(
      isLogo: false,
      isNote: false,
    );
  }
}
