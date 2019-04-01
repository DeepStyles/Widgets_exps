import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widgetsproject/SwitchMode.dart';
import 'package:widgetsproject/backgrouddrawing.dart';
import 'package:widgetsproject/customlist.dart';
import 'package:widgetsproject/nestedanime.dart';
import 'package:widgetsproject/transformbuilder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SwitchMapMode(
        size: Size(200, 70),
      )),
    );
  }
}

class ColumnWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ReloadWidget(),
        NesedAnimation(),
        SizedBox(
          height: 30,
        ),
        SwitchMapMode()
      ],
    );
  }
}
