import 'package:flutter/material.dart';
import 'package:picture_perfect/screens/home.dart';

const apiKey = '563492ad6f91700001000001a9c6f3785da64552b01662f281fd951e';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}
