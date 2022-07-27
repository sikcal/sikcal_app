import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalender extends StatefulWidget {
  MyCalender({Key? key, required this.issuccess}) : super(key: key);

  var issuccess;

  @override
  _MyCalender createState() => _MyCalender();
}

class _MyCalender extends State<MyCalender> {

  @override
  Widget build(BuildContext context) {

    var _issuccess = widget.issuccess[0];

    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronVisible: true,
        rightChevronVisible: true,
      ),
      eventLoader: (day) {
        if((day.day.toInt()<=_issuccess.length)&&(_issuccess[day.day.toInt()-1] == "SUCCESS")) {
          return ['mark'];
        }else {
          return [];
        }
      },
      onPageChanged: (focusedDay) {
        DateTime current = DateTime.now();
        var current_month = DateFormat('M').format(current);
        var focused_month = DateFormat('M').format(focusedDay);

        if((int.parse(current_month)-int.parse(focused_month)) == 0) {
          _issuccess = widget.issuccess[0];
        }else if((int.parse(current_month)-int.parse(focused_month)) == 1) {
          _issuccess = widget.issuccess[1];
        }else if((int.parse(current_month)-int.parse(focused_month)) == 2) {
          _issuccess = widget.issuccess[2];
        }
    },
    );
  }
}