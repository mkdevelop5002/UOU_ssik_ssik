import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kisik_app/utils/starRating.dart';

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
        double starpoint = 0;
        return Builder(builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              RatingBarIndicator(
                rating: starpoint,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 20.0,
                direction: Axis.horizontal,
              ),
              Text(
                payload,
                style: TextStyle(fontSize: 20),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () async {
                    var result = await showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            //Dialog Main Title
                            title: Column(
                              children: <Widget>[
                                new Text("이 메뉴는 어땠나요?"),
                                RatingBar.builder(
                                  initialRating: 0,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    starpoint = rating;
                                  },
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          print(starpoint);
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                                title: new Text("평가가 완료되었습니다.",
                                                    textAlign:
                                                        TextAlign.center),
                                                content: new Text("감사합니다 :)",
                                                    textAlign:
                                                        TextAlign.center),
                                                actions: <Widget>[
                                                  new TextButton(
                                                    child: new Text("확인"),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Text('확인')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('취소'))
                                  ],
                                )
                              ],
                            ),
                          );
                        });
                  },
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
              ),
            ],
          );
        });
      }).toList());
}
