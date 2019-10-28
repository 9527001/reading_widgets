import 'package:flutter/material.dart';
import 'package:reading_widgets/reading_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                margin: EdgeInsets.symmetric(horizontal: 56,vertical: 16),
                title: "登录",
                color: Colors.transparent,
                borderColor: RdColors.COLOR_THEME_BLUE,
              ),
              RdCard.general(
                child: Text(
                  "测试",
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                constraints: BoxConstraints.expand(height: 56,),
                elevationColor: Colors.black12,
                radius: 10,
                color: Colors.white,
              ),
              RdButton.orange(
                onPressed: () {},
                title: "测试",
                constraints: BoxConstraints.expand(height: 56),
                margin: EdgeInsets.symmetric(horizontal: 56,vertical: 16),
                isGradient: true,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(40),
                ),
              ),
              RdCard.general(
                child: Text(
                  "测试",
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
                constraints: BoxConstraints.expand(height: 56),
                elevationColor: Colors.black12,
                radius: 10,
                verticalDirection: VerticalDirection.up,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
