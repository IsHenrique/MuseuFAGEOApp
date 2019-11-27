import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fossil/pages/home_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FAGEO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Noto Serif',
      ),
      home: HomePage(),
    );
  }
}
