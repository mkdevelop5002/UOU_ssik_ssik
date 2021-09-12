import 'package:flutter/material.dart';
import 'package:kisik_app/utils/weekMenuCard.dart';

MenuToString(List<Map<String, dynamic>> LunchDinner, int idx) {
  String MenuText;
  String AppbarTitleText = MenuText =
      LunchDinner[weekdayList.indexOf(weekdayList[idx])]['title'].trim();
  return MenuText;
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
      required this.dinner,
      required this.checkWeek})
      : super(key: key);
  final List<Map<String, dynamic>> morning;
  final List<Map<String, dynamic>> lunch;
  final List<Map<String, dynamic>> dinner;
  final int checkWeek;

  @override
  Widget build(BuildContext context) {
    String weekTitleText = checkWeek == 0 ? '학생식당 주간 식단표' : '기숙사 주간 식단표';
    return Scaffold(
        appBar: AppBar(
          title:
              Text(weekTitleText, style: TextStyle(color: Colors.orangeAccent)),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(16.0),
            childAspectRatio: 8.0 / 15.0,
            children: List<Widget>.generate(weekdayList.length, (idx) {
              return weekMenuCard(weekdayList[idx], MenuToString(lunch, idx),
                  MenuToString(dinner, idx));
            })));
  }
}
