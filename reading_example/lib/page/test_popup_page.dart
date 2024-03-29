import 'package:flutter/material.dart';
import 'package:jvtd_dialog/jvtd_dialog.dart';
import 'package:reading_widgets/reading_widgets.dart';

class TestPopupPage extends StatefulWidget {
  TestPopupPage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _TestPopupPageState createState() => _TestPopupPageState();
}

class _TestPopupPageState extends State<TestPopupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试自定义控件"),
      ),
      body:  Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(onPressed: (){
              showJvtdDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return _pop();
                  });
            }, child: Container(
              alignment:Alignment.center,child: Text('层级嵌套弹窗'),color: Colors.amber,
              constraints: BoxConstraints.expand(width: 100,height: 100),)),
          ],
        ),
      )
    );
  }

  Widget _pop(){
    return RdAlertDialog(title: "选择分类", container: Container(
      child: Text(
        '测试布局',
        style: TextStyle(color: RdColors.COLOR_666, fontSize: 16),
      ),
    ), buttonText: "确定", onPressed: (){

    });
  }
}
