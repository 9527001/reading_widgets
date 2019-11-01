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
        color: Colors.amber,
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              RdButton.border(
                onPressed: () {},
                constraints: BoxConstraints.expand(height: 56),
                margin: EdgeInsets.symmetric(horizontal: 56, vertical: 16),
                title: "边框按钮",
                color: Colors.transparent,
                borderColor: RdColors.COLOR_THEME_BLUE,
              ),
              RdCard.general(
                child: Text(
                  "阴影卡片布局，下阴影",
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                constraints: BoxConstraints.expand(
                  height: 56,
                ),
                elevationColor: Colors.black12,
                radius: 10,
                color: Colors.white,
              ),
              RdButton.general(
                onPressed: () {},
                isSubscript: true,
                isShadow: true,
                shadowColor: RdColors.COLOR_THEME_BLUE,
                elevationColor: RdColors.COLOR_THEME_ORANGE,
                title: "渐变色按钮",
                constraints: BoxConstraints.expand(height: 56),
                margin: EdgeInsets.symmetric(horizontal: 56, vertical: 16),
                gradient: RdColors.GRADIENT_THEME_ORANGE_BACKGROUND,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(40),
                ),
              ),
              RdCard.general(
                child: Text(
                  "阴影卡片布局，上阴影",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: RdColors.COLOR_THEME_BLUE, fontFamily: RdFonts.THEME),
                ),
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
                constraints: BoxConstraints.expand(height: 56),
                elevationColor: Colors.black12,
                radius: 10,
                verticalDirection: VerticalDirection.up,
                color: Colors.white,
              ),
              RdCheckGroup(datas: ["123","12312312","123123121"], onSelected: (values){
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
