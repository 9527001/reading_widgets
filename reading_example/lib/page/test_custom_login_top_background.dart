import 'package:flutter/material.dart';
import 'package:reading_widgets/reading_widgets.dart';

class CustomLoginTopBackgroundPage extends StatefulWidget {
  @override
  _CustomLoginTopBackgroundPageState createState() =>
      _CustomLoginTopBackgroundPageState();
}

class _CustomLoginTopBackgroundPageState
    extends State<CustomLoginTopBackgroundPage> {
  @override
  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('test'),
//      ),
//      body: Container(
//        child: LoginTopBackground.login(),
//      ),
//    );

    return Container(
      color: Colors.white,
      child: LoginTopBackground.findPassword(onPressed: (){
        Navigator.pop(context);
      }),
    );
  }
}
