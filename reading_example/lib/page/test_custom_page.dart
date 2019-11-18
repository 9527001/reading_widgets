import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reading_widgets/reading_widgets.dart';
import 'package:jvtd_uikit/jvtd_uikit.dart';

class TestCustomPage extends StatefulWidget {
  TestCustomPage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _TestCustomPageState createState() => _TestCustomPageState();
}

class _TestCustomPageState extends State<TestCustomPage> {
  String _value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RdAppBar.whiteBack(context, title: "测试"),
      body: Container(
//        color: Colors.amber,
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              RdButton.blueGeneral(
                  onPressed: () {
                    RdToast.show(context, "123", RdImages.LOGIN_PASSWORD, package: RdImages.PACKAGE);
                  },
                  title: "登录",
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 8)),
              RdButton.blueBorder(onPressed: () {}, title: "注册", margin: EdgeInsets.symmetric(horizontal: 40, vertical: 8)),
              RdTextField.login(
                  hint: "请输入",
                  label: _value,
                  type: RdTextFieldType.phone,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  suffix: RdCountdownButton(title: "获取验证码", timeOutTitle: "重新获取", countdownTitle: " S", onPressed: _getCode())),
              RdCheckGroup(
                  datas: ["123", "12312312", "123123121"],
                  onSelected: (values) {
//                print(values);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  bool select = false;

  Future<bool> _getCode() async {
    await new Future.delayed(new Duration(milliseconds: 3000));
    return false;
  }
}
