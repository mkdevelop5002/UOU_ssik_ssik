import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kisik_app/screen/weekMenu.dart';
import 'package:kisik_app/utils/horizontalAnimate.dart';
import 'package:kisik_app/utils/realTime.dart';
import 'package:web_scraper/web_scraper.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WebScraper webScraper;
  bool load = false;
  String morning_menu = "";
  String lunch_menu = "";
  String dinner_menu = "";
  String info_text = "";
  String today_weekday = DateFormat('EEEE').format(DateTime.now());
  late List<Map<String, dynamic>> morning;
  late List<Map<String, dynamic>> lunch;
  late List<Map<String, dynamic>> dinner;

  List weekdayList = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  void initState() {
    super.initState();
    getDate();
  }

// /kor/CMS/DietMenuMgr/list.do?mCode=MN132&searchDietCategory=3
// /kor/CMS/DietMenuMgr/list.do
  getDate() async {
    webScraper = WebScraper('https://www.ulsan.ac.kr');
    if (await webScraper.loadWebPage(
        '/kor/CMS/DietMenuMgr/list.do?mCode=MN132&searchDietCategory=3')) {
      List<Map<String, dynamic>> morning_results =
          webScraper.getElement('ul.res-depth1 ', ['title']);
      List<Map<String, dynamic>> lunch_results =
          webScraper.getElement('ul.res-depth2 ', ['title']);
      List<Map<String, dynamic>> dinner_results =
          webScraper.getElement('ul.res-depth3 ', ['title']);

      List<Map<String, dynamic>> info_results =
          webScraper.getElement('div.txt', ['title']);

      setState(() {
        load = true;
        morning = morning_results;
        lunch = lunch_results;
        dinner = dinner_results;
        info_text = info_results[0]['title'];
        morning_menu =
            morning_results[weekdayList.indexOf(today_weekday)]['title'];
        morning_menu = morning_menu.trim();

        lunch_menu = lunch_results[weekdayList.indexOf(today_weekday)]['title'];
        lunch_menu = lunch_menu.trim();

        dinner_menu =
            dinner_results[weekdayList.indexOf(today_weekday)]['title'];
        dinner_menu = dinner_menu.trim();
      });
    }
  }

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
            SizedBox(
              height: 30,
            ),
            realTime(),
            SizedBox(
              height: 30,
            ),
            horizontalDragAnimate(morning_menu, lunch_menu, dinner_menu, load),
            Text(
                '[조식]08:00~09:00\n[중식]12:00~13:30 (공휴일,토요일 12:00~13:00)\n[석식]17:00~18:00 (공휴일,토요일 17:00~18:00)\n'),
            SizedBox(
              height: 30,
            ),
            Text(info_text),
            SizedBox(
              height: 30,
            ),
            Text('기숙사 식당 위치 : 무거관 1층'),
            SizedBox(
              height: 30,
            ),
            Text('기숙사 식당 문의 : 052-259-2671'),
            SizedBox(
              height: 30,
            ),
            Text(' \u{2714} 식단표는 매주 월요일 점심에 업데이트 됩니다.')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    weekMenu(morning: morning, lunch: lunch, dinner: dinner)),
          );
        },
        tooltip: '주간 식단표 보기',
        child: Icon(Icons.assignment_sharp),
      ),
    );
  }
}
