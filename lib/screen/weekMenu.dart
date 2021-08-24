import 'package:flutter/material.dart';

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
    );
  }
}
