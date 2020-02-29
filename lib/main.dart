import 'package:flutter/material.dart';
import 'package:flutter_mine/screens/campo_minado_app.dart';
import 'file:///C:/Users/Waifu/AndroidStudioProjects/flutter_mine/lib/screens/mainPage/menu.dart';

void main() => runApp(
  new MaterialApp(
    builder: (context, child) => new SafeArea(child: child),
    home: new Home(),
  ),
);

