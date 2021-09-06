import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

Widget weekMenuCard(
    String weekName, String weekLunchMenu, String weekDinnerMenu) {
  String test_text =
      'test식단표입니다.\n\n잡곡밥/쌀밥\n참치김치찌개\n간장돈불고기\n물만두찜&양념장\n케이준치킨샐러드\n깍두기\n수제자몽허니블랙티';
  return Card(
    child: Container(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(weekName),
                Divider(
                  color: Colors.grey,
                ),
                Text(
                  weekLunchMenu,
                  style: TextStyle(fontSize: 10),
                ),
                DottedLine(),
                Text(
                  weekDinnerMenu,
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ))),
  );
}
