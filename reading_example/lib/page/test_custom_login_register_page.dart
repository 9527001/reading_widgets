import 'package:flutter/material.dart';
import 'package:reading_widgets/reading_widgets.dart';

class CustomLoginRegisterPage extends StatefulWidget {
  @override
  _CustomLoginTopBackgroundPageState createState() =>
      _CustomLoginTopBackgroundPageState();
}

class _CustomLoginTopBackgroundPageState
    extends State<CustomLoginRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return LoginTopBackground.register();
  }
}