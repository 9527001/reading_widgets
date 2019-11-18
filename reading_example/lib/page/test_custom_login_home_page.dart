import 'package:flutter/material.dart';
import 'package:reading_widgets/reading_widgets.dart';

class CustomLoginHomePage extends StatefulWidget {
  @override
  _CustomLoginTopBackgroundPageState createState() =>
      _CustomLoginTopBackgroundPageState();
}

class _CustomLoginTopBackgroundPageState extends State<CustomLoginHomePage> {
  @override
  Widget build(BuildContext context) {
//    return Container(child: RdLoginTopBackground.general(isLogo: true, isNote: true),);
    return Scaffold(
//      bottomNavigationBar: Container(
//          child:
      body: Column(children: <Widget>[
        RdLoginTopBackground.general(isLogo: true, isNote: false),

        RdButton.general(
          onPressed: () {
//              Toast.show('登录', context);
          },
          title: '登录',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: RdFonts.AlibabaPuHuiTi),
          color: Color(0xff39ABFF),
          elevationColor: Color(0xff189CFE),
          isShadow: true,
          shadowColor: Color(0xffC4E7FF),
          margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
          isInk: true,
        ),
      ]),
    );
    return Column(children: <Widget>[
      Container(
          child: RdLoginTopBackground.general(isLogo: true, isNote: true)),
      SizedBox(
        height: 100,
      ),
      RdButton.general(
        onPressed: () {
//              Toast.show('登录', context);
        },
        title: '登录',
        style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: RdFonts.AlibabaPuHuiTi),
        color: Color(0xff39ABFF),
        elevationColor: Color(0xff189CFE),
        isShadow: true,
        shadowColor: Color(0xffC4E7FF),
        margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
        isInk: true,
      ),
    ]);
    return RdLoginTopBackground.general(isLogo: true, isNote: true);
  }
}
