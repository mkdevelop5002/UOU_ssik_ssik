import 'package:flutter/material.dart';
import 'package:kisik_app/utils/horizontalAnimate.dart';
import 'package:kisik_app/utils/realTime.dart';

Widget kisikPage(String morning_menu, String lunch_menu, String dinner_menu,
    bool load, String info_text, bool checkMenu) {
  String haksik_time = '[조식 시간]08:00~10:00\n\n[중식 시간]10:00~14:00\n';
  String kisik_time =
      '[조식]08:00~09:00\n[중식]12:00~13:30 (공휴일,토요일 12:00~13:00)\n[석식]17:00~18:00 (공휴일,토요일 17:00~18:00)\n';
  String haksik_loc_text = '학생 식당 위치 : 1층 학생식당';
  String haksik_tel_text = '학생 식당 문의 : 052-259-2026';
  String kisik_loc_text = '기숙사 식당 위치 : 무거관 1층';
  String kisik_tel_text = '기숙사 식당 문의 : 052-259-2671';

  return Center(
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        realTime(),
        SizedBox(
          height: 30,
        ),
        horizontalDragAnimate(
            morning_menu, lunch_menu, dinner_menu, load, checkMenu),
        Text(checkMenu == true ? haksik_time : kisik_time),
        SizedBox(
          height: 30,
        ),
        Text(info_text),
        SizedBox(
          height: 30,
        ),
        Text(checkMenu == true ? haksik_loc_text : kisik_loc_text),
        SizedBox(
          height: 30,
        ),
        Text(checkMenu == true ? haksik_tel_text : kisik_tel_text),
        SizedBox(
          height: 30,
        ),
        Text(' \u{2714} 식단표는 매주 월요일 점심에 업데이트 됩니다.')
      ],
    ),
  );
}
