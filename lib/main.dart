import 'package:flutter/material.dart';
import 'HomePage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Page",
      home: HomePage(),
    );
  }
}
void main() => runApp(MyApp());