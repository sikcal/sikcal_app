import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalender extends StatefulWidget {
  MyCalender({Key? key, required this.issuccess}) : super(key: key);

  var issuccess;

  @override
  _MyCalender createState() => _MyCalender();
}

class _MyCalender extends State<MyCalender> {
  final currentDate = DateTime.now();
  Map<DateTime, dynamic> successInfo = {};

  @override
  void initState() {
    super.initState();
    final startDate = DateTime(currentDate.year, currentDate.month - 2, 1);
    List successData = [];
    successData.addAll(widget.issuccess[2]); // 2달 전
    successData.addAll(widget.issuccess[1]); // 1달 전
    successData.addAll(widget.issuccess[0]); // 이번 달

    int offset = 0;
    while (currentDate.difference(startDate.add(Duration(days: offset))).inDays >= 1) {
      successInfo[startDate.add(Duration(days: offset))] = successData[offset];
      ++offset;
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime _focusedDay = DateTime.now();

    //현재 날짜 기준으로 firstday, lastday 구함
    DateTime current = DateTime.now();
    DateTime firstday = DateTime(current.year, current.month - 2, 1);
    DateTime lastday = DateTime(current.year, current.month + 1, 0);

    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: firstday,
      lastDay: lastday,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronVisible: true,
        rightChevronVisible: true,
      ),
      eventLoader: (day) {
        if (successInfo[DateTime(day.year, day.month, day.day)] == "SUCCESS") {
          return ['mark'];
        } else {
          return [];
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
