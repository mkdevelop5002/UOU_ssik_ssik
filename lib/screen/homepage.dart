import 'package:flutter/material.dart';
import 'package:kisik_app/screen/weekMenu.dart';
import 'package:date_format/date_format.dart';
import 'package:timer_builder/timer_builder.dart';

Widget realTime() {
  return TimerBuilder.periodic(
    const Duration(seconds: 1),
    builder: (BuildContext context) {
      return Text(formatDate(DateTime.now(),
          [yyyy, '년 ', mm, '월 ', dd, '일 ', hh, ':', nn, ':', ss, ' ', am]));
    },
  );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.orangeAccent),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            realTime(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => weekMenu()),
          );
        },
        tooltip: '주간 식단표 보기',
        child: Icon(Icons.assignment_sharp),
      ),
    );
  }
}
