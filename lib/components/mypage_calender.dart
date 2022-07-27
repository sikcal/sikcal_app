import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

import '../data/shared_preferences.dart';

class MyCalender extends StatefulWidget {
  MyCalender({Key? key}) : super(key: key);

  @override
  _MyCalender createState() => _MyCalender();
}

class _MyCalender extends State<MyCalender> {
  // List<dynamic> issuccess = [];

   getData() async {

    final url = Uri.http("43.200.102.54:8080","/api/user/calendar", {"yearMonth":"2022-07-23"});
    final req = http.Request("GET", url);
    req.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';

    final res = await req.send();

    print("res:");
    print(res.statusCode);
    // List<dynamic> response = jsonDecode(await res.stream.bytesToString());
    List<dynamic> issuccess = jsonDecode(await res.stream.bytesToString());
    print(issuccess);
    // print(response);

    return true;
  }

  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    getData();


    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime(now.year, now.month,     1),
      lastDay: DateTime(now.year, now.month + 1, 0),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronVisible: false,
        rightChevronVisible: false
      ),
      eventLoader: (day) {

        for (int i=0;i<9; i++) {
          if(day.day.toInt() == i+1) {
            return['mark'];
          }
          return[];
        }
        return [];
      }
    );
  }
}