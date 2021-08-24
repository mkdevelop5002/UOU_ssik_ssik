import 'package:flutter/material.dart';
import 'package:kisik_app/screen/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '기식을 알려줘',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '울산대학교 기숙사 식당 메뉴'),
    );
  }
}
