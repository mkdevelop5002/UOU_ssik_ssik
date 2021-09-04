import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

Widget realTime() {
  return TimerBuilder.periodic(
    const Duration(seconds: 1),
    builder: (BuildContext context) {
      return Text(formatDate(DateTime.now(),
          [yyyy, '년 ', mm, '월 ', dd, '일 ', hh, ':', nn, ':', ss, ' ', am]));
    },
  );
}
