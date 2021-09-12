import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kisik_app/screen/kisikPage.dart';
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
  late WebScraper webScraperKisik;
  late WebScraper webScraperHaksik;
  bool load = false;
  bool load2 = false;
  String morning_menu_kisik = "";
  String lunch_menu_kisik = "";
  String dinner_menu_kisik = "";
  String info_text_kisik = "";
  String morning_menu_haksik = "";
  String lunch_menu_haksik = "";
  String dinner_menu_haksik = "";
  String info_text_haksik = "";
  String today_weekday = DateFormat('EEEE').format(DateTime.now());
  late List<Map<String, dynamic>> morning_kisik;
  late List<Map<String, dynamic>> lunch_kisik;
  late List<Map<String, dynamic>> dinner_kisik;
  late List<Map<String, dynamic>> morning_haksik;
  late List<Map<String, dynamic>> lunch_haksik;
  late List<Map<String, dynamic>> dinner_haksik;

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
    getDateKisik();
    getDateHaksik();
  }

// /kor/CMS/DietMenuMgr/list.do?mCode=MN132&searchDietCategory=3
// /kor/CMS/DietMenuMgr/list.do
  getDateKisik() async {
    webScraperKisik = WebScraper('https://www.ulsan.ac.kr');
    if (await webScraperKisik.loadWebPage(
        '/kor/CMS/DietMenuMgr/list.do?mCode=MN132&searchDietCategory=3')) {
      List<Map<String, dynamic>> morning_results_kisik =
          webScraperKisik.getElement('ul.res-depth1 ', ['title']);
      List<Map<String, dynamic>> lunch_results_kisik =
          webScraperKisik.getElement('ul.res-depth2 ', ['title']);
      List<Map<String, dynamic>> dinner_results_kisik =
          webScraperKisik.getElement('ul.res-depth3 ', ['title']);

      List<Map<String, dynamic>> info_results_kisik =
          webScraperKisik.getElement('div.txt', ['title']);

      setState(() {
        load = true;
        morning_kisik = morning_results_kisik;
        lunch_kisik = lunch_results_kisik;
        dinner_kisik = dinner_results_kisik;
        info_text_kisik = info_results_kisik[0]['title'];
        morning_menu_kisik =
            morning_results_kisik[weekdayList.indexOf(today_weekday)]['title'];
        morning_menu_kisik = morning_menu_kisik.trim();

        lunch_menu_kisik =
            lunch_results_kisik[weekdayList.indexOf(today_weekday)]['title'];
        lunch_menu_kisik = lunch_menu_kisik.trim();

        dinner_menu_kisik =
            dinner_results_kisik[weekdayList.indexOf(today_weekday)]['title'];
        dinner_menu_kisik = dinner_menu_kisik.trim();
      });
    }
  }

  getDateHaksik() async {
    webScraperHaksik = WebScraper('https://www.ulsan.ac.kr');
    if (await webScraperHaksik.loadWebPage(
        '/kor/CMS/DietMenuMgr/list.do?mCode=MN132&searchDietCategory=1')) {
      List<Map<String, dynamic>> morning_results_haksik =
          webScraperHaksik.getElement('ul.res-depth1 ', ['title']);
      List<Map<String, dynamic>> lunch_results_haksik =
          webScraperHaksik.getElement('ul.res-depth2 ', ['title']);
      List<Map<String, dynamic>> dinner_results_haksik =
          webScraperHaksik.getElement('ul.res-depth4 ', ['title']);

      List<Map<String, dynamic>> info_results_haksik =
          webScraperHaksik.getElement('div.txt', ['title']);

      setState(() {
        load2 = true;
        morning_haksik = morning_results_haksik;
        lunch_haksik = lunch_results_haksik;
        dinner_haksik = dinner_results_haksik;
        info_text_haksik = info_results_haksik[0]['title'];
        morning_menu_haksik =
            morning_results_haksik[weekdayList.indexOf(today_weekday)]['title'];
        morning_menu_haksik = morning_menu_haksik.trim();

        lunch_menu_haksik =
            lunch_results_haksik[weekdayList.indexOf(today_weekday)]['title'];
        lunch_menu_haksik = lunch_menu_haksik.trim();

        dinner_menu_haksik =
            dinner_results_haksik[weekdayList.indexOf(today_weekday)]['title'];
        dinner_menu_haksik = dinner_menu_haksik.trim();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              widget.title,
              style: TextStyle(color: Colors.orangeAccent),
            ),
            backgroundColor: Colors.white,
            bottom: TabBar(labelColor: Colors.orangeAccent, tabs: [
              Tab(text: '학식이'),
              Tab(text: '기식이'),
            ]),
          ),
          body: TabBarView(children: [
            kisikPage(morning_menu_haksik, lunch_menu_haksik,
                dinner_menu_haksik, load2, info_text_haksik, true),
            kisikPage(morning_menu_kisik, lunch_menu_kisik, dinner_menu_kisik,
                load, info_text_kisik, false),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (DefaultTabController.of(context)!.index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => weekMenu(
                            morning: morning_kisik,
                            lunch: lunch_kisik,
                            dinner: dinner_kisik,
                            checkWeek: 1,
                          )),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => weekMenu(
                            morning: morning_haksik,
                            lunch: lunch_haksik,
                            dinner: dinner_haksik,
                            checkWeek: 0,
                          )),
                );
              }
            },
            tooltip: '주간 식단표 보기',
            child: Icon(Icons.assignment_sharp),
          ),
        );
      }),
    ));
  }
}
