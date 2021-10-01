import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget horizontalDragAnimate(String moring, String lunch, String dinner,
    bool load, bool checkMenu, int todayWeek) {
  List payloadList = checkMenu == true
      ? ['천원 조식 메뉴', '일품 메뉴', '한식 메뉴']
      : ['아침 메뉴', '점심 메뉴', '저녁 메뉴'];
  List menuList = [moring, lunch, dinner];
  String sundayText = '일요일은 식당을 운영하지 않습니다.';
  return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 0.7,
        aspectRatio: 2.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: payloadList.map((payload) {
        var index = payloadList.indexOf(payload);
        return Builder(builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              Text(
                payload,
                style: TextStyle(fontSize: 20),
              ),
              Flexible(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: load
                        ? Text(
                            todayWeek == 6 ? sundayText : menuList[index],
                            textAlign: TextAlign.center,
                          )
                        : Text('로딩중입니다...'),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.greenAccent,
                    ),
                    color: Colors.transparent,
                  ),
                  //fit: BoxFit.fill,
                ),
              ),
            ],
          );
        });
      }).toList());
}
