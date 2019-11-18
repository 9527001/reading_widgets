import 'package:flutter/material.dart';
import 'package:reading_widgets/reading_widgets.dart';

class CustomLoginHomePage extends StatefulWidget {
  @override
  _CustomLoginTopBackgroundPageState createState() =>
      _CustomLoginTopBackgroundPageState();
}

class _CustomLoginTopBackgroundPageState
    extends State<CustomLoginHomePage> {
  @override
  Widget build(BuildContext context) {
    return LoginTopBackground.login();
  }
}
