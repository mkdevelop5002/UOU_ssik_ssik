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

List weekdayList = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
];

class weekMenu extends StatelessWidget {
  const weekMenu(
      {Key? key,
      required this.morning,
      required this.lunch,
      required this.dinner})
      : super(key: key);
  final List<Map<String, dynamic>> morning;
  final List<Map<String, dynamic>> lunch;
  final List<Map<String, dynamic>> dinner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('울산대학교 주간 식단표',
              style: TextStyle(color: Colors.orangeAccent)),
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
            children: List<Widget>.generate(weekdayList.length, (idx) {
              return weekMenuCard(
                  weekdayList[idx],
                  lunch[weekdayList.indexOf(weekdayList[idx])]['title'].trim(),
                  morning[weekdayList.indexOf(weekdayList[idx])]['title']
                      .trim());
            })));
  }
}
