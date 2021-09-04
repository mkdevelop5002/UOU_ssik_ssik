import 'package:flutter/material.dart';

Widget weekMenuCard() {
  return Card(
      child: Container(
          child: Align(
    alignment: Alignment.center,
    child: Text('월요일'),
  )));
}

class weekMenu extends StatelessWidget {
  const weekMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('울산대학교 주간 식단표', style: TextStyle(color: Colors.orangeAccent)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: <Widget>[weekMenuCard()],
      ),
    );
  }
}
