import 'package:flutter/material.dart';
import 'package:reading_widgets/reading_widgets.dart';
import 'page/test_custom_page.dart';
import 'page/test_question_page.dart';
import 'page/test_drag_page.dart';
import 'page/test_popup_page.dart';

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
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        // 这里可以定义静态路由，不能传递参数
        '/test_custom': (_) => new TestCustomPage(),
        '/test_question': (_) => new TestQuestionPage(),
        '/test_drag': (_) => new TestDragPage(),
        '/test_popup': (_) => new TestPopupPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('睿丁英语布局测试'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '自定义样式',
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/test_custom');
            },
          ),
          ListTile(
            title: Text(
              '问答题测试',
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/test_question');
            },
          ),
          ListTile(
            title: Text(
              '拖拽测试',
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/test_drag');
            },
          ),
          ListTile(
            title: Text(
              '弹窗布局测试',
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/test_popup');
            },
          )
        ],
      ),
    );
  }
}
