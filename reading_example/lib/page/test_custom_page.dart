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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试自定义控件"),
      ),
      body: Container(
//        color: Colors.amber,
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              RdButton.blueGeneral(onPressed: () {}, title: "登录",margin: EdgeInsets.symmetric(horizontal: 40,vertical: 8)),
              RdButton.blueBorder(onPressed: () {}, title: "注册",margin: EdgeInsets.symmetric(horizontal: 40,vertical: 8)),
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
}
